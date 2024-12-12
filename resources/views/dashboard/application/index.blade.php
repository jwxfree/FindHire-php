@extends('dashboard.layouts.main')

@section('main')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">List of Applicants</h1>
    </div>
    <div class="row">
        <div class="col-md-10">
            <x-flash-message type="success" />
            <table class="table table-striped my-3 align-middle">
                <thead class="table-success">
                    <tr>
                        <th scope="col">No</th>
                        <th scope="col">Name</th>
                        <th scope="col">Position</th>
                        <th scope="col">Attachment</th>
                        <th scope="col">Time applied</th>
                        <th scope="col">Action</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($apps as $app)
                        <tr>
                            <th scope="row">{{ $loop->iteration }}</th>
                            <td><a href="/dashboard/applications/{{ $app->id }}" class="text-decoration-none text-dark">
                                    {{ $app->applicant->name }} </a> </td>
                            <td>{{ $app->title }}</td>
                            <td>
                                @if ($app->applicant->file)
                                    <a class="text-decoration-none text-dark" target="_blank"
                                        href="{{ asset('storage/' . $app->applicant->file) }}"> <i
                                            data-feather="file"></i>
                                        See or download
                                        file</a>
                                @else
                                    No Attachment
                                @endif
                            </td>
                            <td> {{ $app->created_at->diffForhumans() }} </td>
                            <td><a href="/dashboard/applications/{{ $app->id }}" class="badge bg-success">
                                    <i data-feather="eye"></i>
                                </a>
                            </td>
                            <td>
                                @if ($app->status === 'Accepted')
                                    <span class="badge bg-success">Accepted</span>
                                @elseif ($app->status === 'Rejected')
                                    <span class="badge bg-danger">Rejected</span>
                                @else
                                    <span class="badge bg-secondary">Pending</span>
                                @endif
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <x-modal>
        <x-slot name="header">
            Reject Applicant
        </x-slot>
        <x-slot name="body">
            <p id="name">Are you sure want to Reject</p>
            <div id="modalBody"></div>
        </x-slot>
        <x-slot name="footer">
            <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">cancel</button>
            <form class="d-inline" id="formModal" method="POST" action="/dashboard/lists/">
                @method('delete')
                @csrf
                <button type="submit" class="btn btn-dark">
                    Reject
                </button>
            </form>
        </x-slot>
    </x-modal>

    <script>
        const allShow = document.querySelectorAll('.showModal');
        const title = document.querySelector('#modalBody');
        const form = document.querySelector('#formModal')
        const name = document.querySelector('#name');

        allShow.forEach(show => {
            show.addEventListener('click', () => {
                name.innerHTML = 'Are you sure want to reject ' + show.dataset.name + '?';
                title.innerHTML = 'job\'s title: ' + show.dataset.title;
                form.action = '/dashboard/applications/' + show.dataset.id;
            })
        });
    </script>
@endsection
 