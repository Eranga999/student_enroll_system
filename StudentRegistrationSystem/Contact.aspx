<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="StudentRegistrationSystem.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <!-- Header Section -->
        <section class="text-center mb-5">
            <div class="card border-0 shadow-lg" style="background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); color: white; padding: 60px 20px; border-radius: 20px;">
                <h1 class="display-3 fw-bold mb-3"><i class="fas fa-envelope me-3"></i>Contact Us</h1>
                <p class="lead">Get in touch with us!</p>
            </div>
        </section>

        <!-- Contact Information -->
        <section class="mb-5">
            <div class="row g-4">
                <!-- Address Card -->
                <div class="col-md-4">
                    <div class="card border-0 shadow h-100 text-center">
                        <div class="card-body p-4">
                            <div class="mb-3" style="width: 70px; height: 70px; background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto;">
                                <i class="fas fa-map-marker-alt fa-2x text-white"></i>
                            </div>
                            <h4 class="fw-bold mb-3">Address</h4>
                            <p class="text-muted">Colombo Sri Lanka</p>
                        </div>
                    </div>
                </div>

                <!-- Phone Card -->
                <div class="col-md-4">
                    <div class="card border-0 shadow h-100 text-center">
                        <div class="card-body p-4">
                            <div class="mb-3" style="width: 70px; height: 70px; background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto;">
                                <i class="fas fa-phone fa-2x text-white"></i>
                            </div>
                            <h4 class="fw-bold mb-3">Phone</h4>
                            <p class="text-muted mb-2"><strong>Support:</strong> +94 77 123 4567</p>
                            <p class="text-muted small">Available 24/7</p>
                        </div>
                    </div>
                </div>

                <!-- Email Card -->
                <div class="col-md-4">
                    <div class="card border-0 shadow h-100 text-center">
                        <div class="card-body p-4">
                            <div class="mb-3" style="width: 70px; height: 70px; background: linear-gradient(135deg, #0077b6 0%, #00b4d8 100%); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto;">
                                <i class="fas fa-envelope fa-2x text-white"></i>
                            </div>
                            <h4 class="fw-bold mb-3">Email</h4>
                            <p class="text-muted mb-2"><a href="mailto:info@gmail.com" class="text-decoration-none">info@gmail.com</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Office Hours -->
        <section class="mb-5">
            <div class="card border-0 shadow">
                <div class="card-body p-5 text-center">
                    <h3 class="fw-bold mb-4"><i class="fas fa-clock me-2" style="color: #1e3c72;"></i>Office Hours</h3>
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <p class="mb-1"><strong>Monday - Friday</strong></p>
                            <p class="text-muted">9:00 AM - 6:00 PM</p>
                        </div>
                        <div class="col-md-4 mb-3">
                            <p class="mb-1"><strong>Saturday</strong></p>
                            <p class="text-muted">10:00 AM - 4:00 PM</p>
                        </div>
                        <div class="col-md-4 mb-3">
                            <p class="mb-1"><strong>Sunday</strong></p>
                            <p class="text-muted">Closed</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Call to Action -->
        <section class="text-center">
            <div class="card border-0 shadow-lg" style="background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); color: white; padding: 40px 20px; border-radius: 20px;">
                <h3 class="fw-bold mb-3">Need Help?</h3>
                <p class="lead mb-4">Our team is ready to assist you</p>
                <a href="mailto:support@studentreg.edu" class="btn btn-light btn-lg" style="border-radius: 50px; padding: 12px 40px;">
                    <i class="fas fa-paper-plane me-2"></i>Send Message
                </a>
            </div>
        </section>
    </main>
</asp:Content>

