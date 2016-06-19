<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <!-- Jumbotron Header -->
        <header class="jumbotron hero-spacer">
            <h1>
                <img alt="" class="img-responsive" src="http://www.utm.my/wp-content/uploads/2016/06/ramadhan.jpg" title="ramadhan"/></h1>
            <h1>A Warm Welcome!</h1>
            <p>Here is a centralized platform for the use of lecturers and students in managing courses, subjects and sections. </p>
        </header>

        <hr>

        <!-- Title -->
        <div class="row">
            <div class="col-lg-12">
                <h3>Latest Features</h3>
            </div>
        </div>
        <!-- /.row -->

        <!-- Page Features -->
        <div class="row text-center">

            <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
                    
                    <img src="http://www.utm.my/wp-content/uploads/2016/06/tenderutm.jpg" alt="">
                    <div class="caption">
                        <h3>Tender &amp; Procurement</h3>
                        <p>View list of Tenders & Submit a Quotation to UTM
                           
                        </p>
                        <p>&nbsp;<a href="#" class="btn btn-default">More Info</a>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
                    
                    <img src="http://www.utm.my/dev/2014/img/thumbnail/course.jpg" alt="">
                    <div class="caption">
                        <h3>Manage course</h3>
                        <p>course finder Course Finder. Search & browse for courses available at UTM</p>
                        <p>
                            &nbsp;<a href="#" class="btn btn-default">More Info</a>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
                    
                    <img alt="Apply Now" src="http://www.utm.my/dev/2014/img/thumbnail/applyutm.jpg" /></a>
                    <div class="caption">
                        <h3>Profile</h3>
                        <p>Register profile and manage academic information.</p>
                        <p>
                            &nbsp;<a href="#" class="btn btn-default">More Info</a>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
                    
                    <img alt="faculties and schools" src="http://www.utm.my/dev/2014/img/thumbnail/building.jpg" /></a>
                    <div class="caption">
                        <h3>Manage Section</h3>
                        <p>Register for sections or add marks for sections!</p>
                        <p>
                            &nbsp;<a href="#" class="btn btn-default">More Info</a>
                        </p>
                    </div>
                </div>
            </div>

        </div>

    </div>
</asp:Content>
