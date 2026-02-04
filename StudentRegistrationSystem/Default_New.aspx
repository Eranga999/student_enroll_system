<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StudentRegistrationSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <!-- Hero Section -->
        <section class="hero-section text-center mb-5" style="background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); padding: 80px 20px; border-radius: 20px; color: white; box-shadow: 0 10px 40px rgba(0,0,0,0.3);">
            <div class="container">
                <h1 class="display-3 fw-bold mb-4" style="text-shadow: 2px 2px 4px rgba(0,0,0,0.3);"><i class="fas fa-graduation-cap me-3"></i>Student Registration System</h1>
                <p class="lead mb-4" style="font-size: 1.5rem;">Streamline your educational management with our comprehensive student registration and enrollment platform</p>
                <div class="d-flex justify-content-center gap-3 flex-wrap mt-4">
                    <a href="StudentRegistration.aspx" class="btn btn-light btn-lg shadow-lg" style="border-radius: 50px; padding: 15px 40px;">
                        <i class="fas fa-user-plus me-2"></i>Register New Student
                    </a>
                    <a href="SubjectRegistration.aspx" class="btn btn-outline-light btn-lg shadow" style="border-radius: 50px; padding: 15px 40px; border-width: 2px;">
                        <i class="fas fa-book me-2"></i>Enroll in Subjects
                    </a>
                </div>
            </div>
        </section>

        <!-- Live Statistics Dashboard -->
        <section class="stats-section mb-5">
            <div class="text-center mb-4">
                <h2 class="fw-bold"><i class="fas fa-chart-line me-2" style="color: #1e3c72;"></i>Live Statistics</h2>
                <p class="text-muted">Real-time data from your institution</p>
            </div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card border-0 shadow-lg h-100" style="border-left: 5px solid #1e3c72 !important; transition: transform 0.3s;" onmouseover="this.style.transform='translateY(-10px)'" onmouseout="this.style.transform='translateY(0)'">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-3">
                                <div class="icon-box" style="width: 60px; height: 60px; background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); border-radius: 15px; display: flex; align-items: center; justify-content: center;">
                                    <i class="fas fa-users fa-2x text-white"></i>
                                </div>
                                <div class="ms-3">
                                    <h6 class="text-muted mb-0">Total Students</h6>
                                    <h2 class="mb-0 fw-bold" style="color: #1e3c72;"><asp:Label ID="lblTotalStudents" runat="server" Text="0"></asp:Label></h2>
                                </div>
                            </div>
                            <div class="progress" style="height: 8px;">
                                <div class="progress-bar" role="progressbar" style="width: 85%; background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <small class="text-muted mt-2 d-block"><i class="fas fa-arrow-up text-success"></i> Active registrations</small>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-0 shadow-lg h-100" style="border-left: 5px solid #11998e !important; transition: transform 0.3s;" onmouseover="this.style.transform='translateY(-10px)'" onmouseout="this.style.transform='translateY(0)'">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-3">
                                <div class="icon-box" style="width: 60px; height: 60px; background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%); border-radius: 15px; display: flex; align-items: center; justify-content: center;">
                                    <i class="fas fa-book fa-2x text-white"></i>
                                </div>
                                <div class="ms-3">
                                    <h6 class="text-muted mb-0">Total Subjects</h6>
                                    <h2 class="mb-0 fw-bold" style="color: #11998e;"><asp:Label ID="lblTotalSubjects" runat="server" Text="0"></asp:Label></h2>
                                </div>
                            </div>
                            <div class="progress" style="height: 8px;">
                                <div class="progress-bar" role="progressbar" style="width: 100%; background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <small class="text-muted mt-2 d-block"><i class="fas fa-check text-success"></i> Available courses</small>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-0 shadow-lg h-100" style="border-left: 5px solid #0077b6 !important; transition: transform 0.3s;" onmouseover="this.style.transform='translateY(-10px)'" onmouseout="this.style.transform='translateY(0)'">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-3">
                                <div class="icon-box" style="width: 60px; height: 60px; background: linear-gradient(135deg, #0077b6 0%, #00b4d8 100%); border-radius: 15px; display: flex; align-items: center; justify-content: center;">
                                    <i class="fas fa-clipboard-check fa-2x text-white"></i>
                                </div>
                                <div class="ms-3">
                                    <h6 class="text-muted mb-0">Total Enrollments</h6>
                                    <h2 class="mb-0 fw-bold" style="color: #0077b6;"><asp:Label ID="lblTotalEnrollments" runat="server" Text="0"></asp:Label></h2>
                                </div>
                            </div>
                            <div class="progress" style="height: 8px;">
                                <div class="progress-bar" role="progressbar" style="width: 70%; background: linear-gradient(135deg, #0077b6 0%, #00b4d8 100%);" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <small class="text-muted mt-2 d-block"><i class="fas fa-check-double text-success"></i> Completed registrations</small>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Quick Actions -->
        <section class="quick-actions mb-5">
            <div class="text-center mb-4">
                <h2 class="fw-bold"><i class="fas fa-bolt me-2" style="color: #f39c12;"></i>Quick Actions</h2>
                <p class="text-muted">Everything you need at your fingertips</p>
            </div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm h-100 action-card" style="transition: all 0.3s;" onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 15px 35px rgba(30, 60, 114, 0.3)';" onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 2px 8px rgba(0,0,0,0.1)';">
                        <div class="card-body text-center p-5">
                            <div class="mb-4" style="width: 80px; height: 80px; background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); border-radius: 20px; display: flex; align-items: center; justify-content: center; margin: 0 auto;">
                                <i class="fas fa-user-graduate fa-3x text-white"></i>
                            </div>
                            <h4 class="fw-bold mb-3">Register Student</h4>
                            <p class="text-muted mb-4">Add new students with complete profile information and generate unique student IDs</p>
                            <a href="StudentRegistration.aspx" class="btn btn-primary btn-lg w-100" style="border-radius: 50px;">Start Registration <i class="fas fa-arrow-right ms-2"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm h-100 action-card" style="transition: all 0.3s;" onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 15px 35px rgba(17, 153, 142, 0.3)';" onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 2px 8px rgba(0,0,0,0.1)';">
                        <div class="card-body text-center p-5">
                            <div class="mb-4" style="width: 80px; height: 80px; background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%); border-radius: 20px; display: flex; align-items: center; justify-content: center; margin: 0 auto;">
                                <i class="fas fa-book-reader fa-3x text-white"></i>
                            </div>
                            <h4 class="fw-bold mb-3">Enroll in Subjects</h4>
                            <p class="text-muted mb-4">Select and enroll students in available courses and manage their academic schedule</p>
                            <a href="SubjectRegistration.aspx" class="btn btn-success btn-lg w-100" style="border-radius: 50px;">Browse Subjects <i class="fas fa-arrow-right ms-2"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm h-100 action-card" style="transition: all 0.3s;" onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 15px 35px rgba(0, 119, 182, 0.3)';" onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 2px 8px rgba(0,0,0,0.1)';">
                        <div class="card-body text-center p-5">
                            <div class="mb-4" style="width: 80px; height: 80px; background: linear-gradient(135deg, #0077b6 0%, #00b4d8 100%); border-radius: 20px; display: flex; align-items: center; justify-content: center; margin: 0 auto;">
                                <i class="fas fa-list-alt fa-3x text-white"></i>
                            </div>
                            <h4 class="fw-bold mb-3">View Directory</h4>
                            <p class="text-muted mb-4">Access complete student database with enrollment details and contact information</p>
                            <a href="ViewStudents.aspx" class="btn btn-info btn-lg w-100" style="border-radius: 50px;">View All Students <i class="fas fa-arrow-right ms-2"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Features Overview -->
        <section class="features-overview mb-5" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); padding: 60px 20px; border-radius: 20px;">
            <div class="container">
                <div class="text-center mb-5">
                    <h2 class="fw-bold"><i class="fas fa-star me-2" style="color: #f39c12;"></i>Why Choose Our System?</h2>
                    <p class="text-muted">Powerful features designed for modern education management</p>
                </div>
                <div class="row g-4">
                    <div class="col-md-3 col-sm-6">
                        <div class="text-center">
                            <div class="mb-3" style="width: 60px; height: 60px; background: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                <i class="fas fa-shield-alt fa-2x" style="color: #1e3c72;"></i>
                            </div>
                            <h5 class="fw-bold">Secure & Reliable</h5>
                            <p class="text-muted small">Enterprise-grade security with data encryption</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="text-center">
                            <div class="mb-3" style="width: 60px; height: 60px; background: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                <i class="fas fa-clock fa-2x" style="color: #11998e;"></i>
                            </div>
                            <h5 class="fw-bold">Real-time Updates</h5>
                            <p class="text-muted small">Instant data synchronization across platform</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="text-center">
                            <div class="mb-3" style="width: 60px; height: 60px; background: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                <i class="fas fa-mobile-alt fa-2x" style="color: #0077b6;"></i>
                            </div>
                            <h5 class="fw-bold">Responsive Design</h5>
                            <p class="text-muted small">Works perfectly on all devices and screens</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="text-center">
                            <div class="mb-3" style="width: 60px; height: 60px; background: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                <i class="fas fa-headset fa-2x" style="color: #f39c12;"></i>
                            </div>
                            <h5 class="fw-bold">24/7 Support</h5>
                            <p class="text-muted small">Dedicated support team always ready to help</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Call to Action -->
        <section class="cta-section text-center mb-5">
            <div class="card border-0 shadow-lg" style="background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); color: white; padding: 50px 20px; border-radius: 20px;">
                <div class="card-body">
                    <h2 class="display-5 fw-bold mb-4">Ready to Get Started?</h2>
                    <p class="lead mb-4">Join hundreds of institutions already using our platform to streamline their student management</p>
                    <div class="d-flex justify-content-center gap-3 flex-wrap">
                        <a href="StudentRegistration.aspx" class="btn btn-light btn-lg" style="border-radius: 50px; padding: 15px 40px;">
                            <i class="fas fa-rocket me-2"></i>Register Your First Student
                        </a>
                        <a href="About.aspx" class="btn btn-outline-light btn-lg" style="border-radius: 50px; padding: 15px 40px; border-width: 2px;">
                            <i class="fas fa-info-circle me-2"></i>Learn More
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </main>

</asp:Content>
