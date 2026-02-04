<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="StudentRegistrationSystem.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <!-- Header Section -->
        <section class="text-center mb-5">
            <div class="card border-0 shadow-lg" style="background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); color: white; padding: 60px 20px; border-radius: 20px;">
                <h1 class="display-3 fw-bold mb-3"><i class="fas fa-info-circle me-3"></i>About Us</h1>
                <p class="lead">Transforming Education Management Through Technology</p>
            </div>
        </section>

        <!-- Mission & Vision -->
        <section class="mb-5">
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="card border-0 shadow h-100" style="border-left: 5px solid #1e3c72 !important;">
                        <div class="card-body p-5">
                            <div class="d-flex align-items-center mb-4">
                                <div style="width: 60px; height: 60px; background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); border-radius: 15px; display: flex; align-items: center; justify-content: center;">
                                    <i class="fas fa-bullseye fa-2x text-white"></i>
                                </div>
                                <h3 class="ms-3 mb-0 fw-bold">Our Mission</h3>
                            </div>
                            <p class="text-muted" style="font-size: 1.1rem; line-height: 1.8;">
                                To provide educational institutions with a comprehensive, user-friendly platform that simplifies student registration, 
                                enrollment management, and academic administration. We strive to eliminate paperwork, reduce errors, and create a 
                                seamless experience for administrators, faculty, and students alike.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card border-0 shadow h-100" style="border-left: 5px solid #11998e !important;">
                        <div class="card-body p-5">
                            <div class="d-flex align-items-center mb-4">
                                <div style="width: 60px; height: 60px; background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%); border-radius: 15px; display: flex; align-items: center; justify-content: center;">
                                    <i class="fas fa-eye fa-2x text-white"></i>
                                </div>
                                <h3 class="ms-3 mb-0 fw-bold">Our Vision</h3>
                            </div>
                            <p class="text-muted" style="font-size: 1.1rem; line-height: 1.8;">
                                To be the leading student registration system globally, empowering educational institutions of all sizes with 
                                innovative technology solutions. We envision a future where every school, college, and university can access 
                                enterprise-level management tools that are both powerful and easy to use.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- What We Offer -->
        <section class="mb-5">
            <div class="text-center mb-5">
                <h2 class="fw-bold"><i class="fas fa-gift me-2" style="color: #1e3c72;"></i>What We Offer</h2>
                <p class="text-muted">Comprehensive features for complete education management</p>
            </div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm h-100" style="transition: all 0.3s;" onmouseover="this.style.transform='translateY(-10px)'; this.style.boxShadow='0 15px 35px rgba(0,0,0,0.15)';" onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 2px 8px rgba(0,0,0,0.1)';">
                        <div class="card-body text-center p-4">
                            <div class="mb-3" style="width: 70px; height: 70px; background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto;">
                                <i class="fas fa-user-plus fa-2x text-white"></i>
                            </div>
                            <h4 class="fw-bold mb-3">Easy Registration</h4>
                            <p class="text-muted">Quick and intuitive student registration process with automated ID generation and data validation</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm h-100" style="transition: all 0.3s;" onmouseover="this.style.transform='translateY(-10px)'; this.style.boxShadow='0 15px 35px rgba(0,0,0,0.15)';" onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 2px 8px rgba(0,0,0,0.1)';">
                        <div class="card-body text-center p-4">
                            <div class="mb-3" style="width: 70px; height: 70px; background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto;">
                                <i class="fas fa-graduation-cap fa-2x text-white"></i>
                            </div>
                            <h4 class="fw-bold mb-3">Course Management</h4>
                            <p class="text-muted">Flexible subject enrollment system with real-time availability tracking and conflict detection</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm h-100" style="transition: all 0.3s;" onmouseover="this.style.transform='translateY(-10px)'; this.style.boxShadow='0 15px 35px rgba(0,0,0,0.15)';" onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 2px 8px rgba(0,0,0,0.1)';">
                        <div class="card-body text-center p-4">
                            <div class="mb-3" style="width: 70px; height: 70px; background: linear-gradient(135deg, #0077b6 0%, #00b4d8 100%); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto;">
                                <i class="fas fa-chart-bar fa-2x text-white"></i>
                            </div>
                            <h4 class="fw-bold mb-3">Analytics & Reports</h4>
                            <p class="text-muted">Comprehensive reporting tools with live dashboards and exportable data for informed decision making</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Our Values -->
        <section class="mb-5" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); padding: 60px 20px; border-radius: 20px;">
            <div class="container">
                <div class="text-center mb-5">
                    <h2 class="fw-bold"><i class="fas fa-heart me-2" style="color: #e74c3c;"></i>Our Core Values</h2>
                    <p class="text-muted">Principles that guide everything we do</p>
                </div>
                <div class="row g-4">
                    <div class="col-md-3 col-sm-6">
                        <div class="text-center">
                            <div class="mb-3" style="width: 60px; height: 60px; background: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                <i class="fas fa-lightbulb fa-2x" style="color: #f39c12;"></i>
                            </div>
                            <h5 class="fw-bold">Innovation</h5>
                            <p class="text-muted small">Constantly improving and adapting to new technologies</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="text-center">
                            <div class="mb-3" style="width: 60px; height: 60px; background: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                <i class="fas fa-award fa-2x" style="color: #1e3c72;"></i>
                            </div>
                            <h5 class="fw-bold">Excellence</h5>
                            <p class="text-muted small">Committed to delivering the highest quality service</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="text-center">
                            <div class="mb-3" style="width: 60px; height: 60px; background: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                <i class="fas fa-users fa-2x" style="color: #11998e;"></i>
                            </div>
                            <h5 class="fw-bold">Collaboration</h5>
                            <p class="text-muted small">Working together to achieve common goals</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="text-center">
                            <div class="mb-3" style="width: 60px; height: 60px; background: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                <i class="fas fa-shield-alt fa-2x" style="color: #0077b6;"></i>
                            </div>
                            <h5 class="fw-bold">Integrity</h5>
                            <p class="text-muted small">Maintaining transparency and ethical practices</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Contact CTA -->
        <section class="text-center">
            <div class="card border-0 shadow-lg" style="background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); color: white; padding: 40px 20px; border-radius: 20px;">
                <h3 class="fw-bold mb-3">Have Questions?</h3>
                <p class="lead mb-4">We're here to help! Reach out to us anytime.</p>
                <a href="Contact.aspx" class="btn btn-light btn-lg" style="border-radius: 50px; padding: 12px 40px;">
                    <i class="fas fa-envelope me-2"></i>Contact Us
                </a>
            </div>
        </section>
    </main>
</asp:Content>
