@extends('layouts.main')

@section('container')
    <section class="border shadow">
        <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner bg-dark">
                <!-- <div class="carousel-item active">
                    <img src="https://source.unsplash.com/1200x500/?deal" style="opacity: 30%" class="d-block w-100 bg-dark"
                        alt="Heroes image">
                </div> -->
                <div class="carousel-caption d-none d-md-block my-lg-5">
                    <h3>Find your dream job here</h3>
                    <p>Various career opportunities await you.
                        Find the right career and connect with companies anytime, anywhere.</p>
                    <a class="btn btn-secondary" href="/register">Register Now</a>
                </div>
            </div>
            <div class="row justify-content-center px-3 py-4 d-block d-md-none">
                <div class="col text-center ">
                    <h3>Find your dream job here</h3>
                    <p>Some representative placeholder content for the first slide.And an even wittier subheading to boot.
                        Jumpstart
                        your
                        marketing
                        efforts with this example based on Apple's marketing pages.</p>
                    <a class="btn btn-dark" href="/register">Register Now</a>
                </div>
            </div>
        </div>
    </section>
    <section>
    <div class="d-md-flex justify-content-evenly flex-md-equal w-100 my-md-3 ps-md-3">
        <div class="bg-success my-3 me-md-3 pt-3 px-3 shadow pt-md-5 px-md-5 text-center text-white overflow-hidden">
            <div class="my-3 py-3">
                <h2 class="display-5">Job Seekers</h2>
                <p class="lead">Find and get better job opportunities according to skills and location.</p>
            </div>
            <div class="bg-light shadow-sm mx-auto" style="width: 80%; height: 200px; border-radius: 21px 21px 0 0;">
                <a href="/jobs" class="btn btn-success px-5 py-3" style="position:relative; top:40%;">Search a job</a>
            </div>
        </div>
        <div class="bg-light my-3 me-md-3 pt-3 px-3 shadow pt-md-5 px-md-5 text-center overflow-hidden">
            <div class="my-3 py-3">
                <h2 class="display-5">Company</h2>
                <p class="lead">Post job advertisements to connect with the most potential job seekers.</p>
            </div>
            <div class="bg-success shadow-sm mx-auto" style="width: 80%; height: 200px; border-radius: 21px 21px 0 0;">
                <a href="/register/company" class="btn btn-light px-5 py-3" style="position:relative; top:40%;">Post a job</a>
            </div>
        </div>
    </div>
</section>

    


    <!--- About 
    Us --->

<main>
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner bg-dark">
                <div class="carousel-item active">
                    <!-- <img src="https://source.unsplash.com/1387x768/?deal" style="opacity: 80%" class="d-block w-100 bg-dark" alt="Heroes image"> -->
                    <div class="carousel-caption d-none d-md-block my-lg-5">
                    <h3>About</h3>
                    <h3>FindHire</h3>
                    <p>FindHire is the topest job site in the worldwith unique visitors every month. Indeed strives to put job seekers first, giving them free access to search for jobs, post resumes, and research companies. Every day, we connect millions of people to new opportunities</p>
                    <a class="btn btn-secondary" href="/team">Expert Team</a>
                   </div>
                </div>
            </div>
     </div>
</main>

<!--- Expert 
Team --->

<body>
	
</body>

<!--- Team 
Styling 
--->

<style>
.user-pic {
    width: 250px;
    height: 250px;
    overflow: hidden;
    border-radius: 100%;
    margin: 20px auto 20px;
    border-left: 6px solid #ddd;
    border-right: 6px solid #ddd;
    border-top: 6px solid #212529;
    border-bottom: 6px solid #212529;
    transform:  rotate(720deg);
    transition: 1.0s;
}
.card-box:hover .user-pic {
    transform: rotate(0deg);
    transform: scale(1.0);
}
.card-box {
    padding: 15px;
    background-color: #fdfdfd;
    margin: 20px 0px;
    border-radius: 10px;
    border: 1px solid #eee;
    box-shadow: 0px 0px 0px 0px #d4d4d4;
    transition: 0.5s;
}
.card-box:hover {
	border: 1px solid #212529;
}
.card-box p {
    color: #212529;
}

.btn-primary {
    border-color: #212529;
    background-color: #212529;
    border: 1px solid #212529;
}

.btn-primary:hover{
     background: #ffffff;
     color: black;
}
</style>



@endsection