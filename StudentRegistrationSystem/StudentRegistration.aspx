<%@ Page Title="Student Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentRegistration.aspx.cs" Inherits="StudentRegistrationSystem.StudentRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Hide bootstrap modal on page load */
        .modal.show {
            display: none !important;
        }
        .modal-backdrop.show {
            display: none !important;
        }
    </style>
    <script type="text/javascript">
        function showSuccessModal(studentId, firstName, lastName, email) {
            // Build the success message
            const messageHtml = `
                <div style="text-align: center; padding: 20px;">
                    <div style="font-size: 48px; color: #28a745; margin-bottom: 20px;">
                        ✓
                    </div>
                    <h4 style="color: #28a745; font-weight: bold; margin-bottom: 20px;">
                        Registration Successful!
                    </h4>
                    <div style="background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin-bottom: 20px;">
                        <p style="margin: 10px 0; font-size: 16px;">
                            <strong>Student ID:</strong> ${studentId}
                        </p>
                        <p style="margin: 10px 0; font-size: 16px;">
                            <strong>Name:</strong> ${firstName} ${lastName}
                        </p>
                        <p style="margin: 10px 0; font-size: 16px;">
                            <strong>Email:</strong> ${email}
                        </p>
                    </div>
                    <p style="color: #6c757d; font-style: italic;">
                        The form has been cleared and is ready for the next registration.
                    </p>
                </div>
            `;
            
            document.getElementById('successMessage').innerHTML = messageHtml;
            
            // Remove any existing backdrop first
            const existingBackdrops = document.querySelectorAll('.modal-backdrop');
            existingBackdrops.forEach(bd => bd.remove());
            
            // Hide any open modals
            document.body.classList.remove('modal-open');
            
            // Create and show the modal
            const successModal = document.getElementById('successModal');
            const modal = new bootstrap.Modal(successModal, {
                keyboard: false,
                backdrop: 'static'
            });
            modal.show();
        }

        function clearFormFields() {
            document.getElementById('MainContent_txtFirstName').value = '';
            document.getElementById('MainContent_txtLastName').value = '';
            document.getElementById('MainContent_txtEmail').value = '';
            document.getElementById('MainContent_txtPhoneNumber').value = '';
            document.getElementById('MainContent_txtDateOfBirth').value = '';
            document.getElementById('MainContent_txtAddress').value = '';
            document.getElementById('MainContent_ddlGender').selectedIndex = 0;
            
            var validationSummary = document.querySelector('.alert');
            if (validationSummary && validationSummary.classList.contains('alert-danger')) {
                validationSummary.style.display = 'none';
            }
            
            return false;
        }
        
        // Close any unwanted modals and backdrops on page load
        window.addEventListener('load', function() {
            // Hide all modals except successModal
            var allModals = document.querySelectorAll('.modal');
            allModals.forEach(function(m) {
                if (m.id !== 'successModal') {
                    m.style.display = 'none';
                }
            });
            
            // Remove all modal backdrops
            var backdrops = document.querySelectorAll('.modal-backdrop');
            backdrops.forEach(function(bd) {
                bd.remove();
            });
            
            // Remove modal-open class from body
            document.body.classList.remove('modal-open');
        });
    </script>
    <!-- Header Section -->
    <section class="text-center mb-4">
        <div class="card border-0 shadow-lg" style="background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); color: white; padding: 50px 20px; border-radius: 20px;">
            <h1 class="display-5 fw-bold mb-2"><i class="fas fa-user-plus me-2"></i>Student Registration</h1>
            <p class="lead">Add a new student with a clean, modern form</p>
        </div>
    </section>

    <div class="container mt-4 mb-5">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <div class="card border-0 shadow-lg" style="border-radius: 20px;">
                    <div class="card-header text-white" style="background: linear-gradient(135deg, #0077b6 0%, #00b4d8 100%); border-radius: 20px 20px 0 0;">
                        <h3 class="mb-0"><i class="fas fa-id-card me-2"></i>Registration Details</h3>
                        <p class="small mt-2 mb-0">Please complete all required fields</p>
                    </div>
                    <div class="card-body p-4">
                        <asp:Label ID="lblMessage" runat="server" CssClass="alert" Visible="false"></asp:Label>

                        <!-- Form Row 1 -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <div class="form-group">
                                    <label for="txtFirstName" class="form-label"><i class="fas fa-user"></i> First Name <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control form-control-lg" placeholder="Enter first name" required></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                                        ControlToValidate="txtFirstName" 
                                        ErrorMessage="First Name is required" 
                                        CssClass="text-danger small d-block mt-2" 
                                        Display="None">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <div class="form-group">
                                    <label for="txtLastName" class="form-label"><i class="fas fa-user"></i> Last Name <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control form-control-lg" placeholder="Enter last name" required></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                                        ControlToValidate="txtLastName" 
                                        ErrorMessage="Last Name is required" 
                                        CssClass="text-danger small d-block mt-2" 
                                        Display="None">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <!-- Form Row 2 -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <div class="form-group">
                                    <label for="txtEmail" class="form-label"><i class="fas fa-envelope"></i> Email <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-lg" TextMode="Email" placeholder="student@example.com" required></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                        ControlToValidate="txtEmail" 
                                        ErrorMessage="Email is required" 
                                        CssClass="text-danger small d-block mt-2" 
                                        Display="None">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                                        ControlToValidate="txtEmail" 
                                        ErrorMessage="Invalid email format" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                        CssClass="text-danger small d-block mt-2" 
                                        Display="None">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <div class="form-group">
                                    <label for="txtPhoneNumber" class="form-label"><i class="fas fa-phone"></i> Phone Number <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control form-control-lg" placeholder="0771234567" required></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                                        ControlToValidate="txtPhoneNumber" 
                                        ErrorMessage="Phone number is required" 
                                        CssClass="text-danger small d-block mt-2" 
                                        Display="None">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <!-- Form Row 3 -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <div class="form-group">
                                    <label for="txtDateOfBirth" class="form-label"><i class="fas fa-birthday-cake"></i> Date of Birth <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtDateOfBirth" runat="server" CssClass="form-control form-control-lg" TextMode="Date" required></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDOB" runat="server" 
                                        ControlToValidate="txtDateOfBirth" 
                                        ErrorMessage="Date of Birth is required" 
                                        CssClass="text-danger small d-block mt-2" 
                                        Display="None">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <div class="form-group">
                                    <label for="ddlGender" class="form-label"><i class="fas fa-venus-mars"></i> Gender <span class="text-danger">*</span></label>
                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select form-select-lg">
                                        <asp:ListItem Value="">-- Select Gender --</asp:ListItem>
                                        <asp:ListItem Value="Male">Male</asp:ListItem>
                                        <asp:ListItem Value="Female">Female</asp:ListItem>
                                        <asp:ListItem Value="Other">Other</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvGender" runat="server" 
                                        ControlToValidate="ddlGender" 
                                        ErrorMessage="Gender is required" 
                                        CssClass="text-danger small d-block mt-2" 
                                        Display="None"
                                        InitialValue="">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <!-- Form Row 4 -->
                        <div class="mb-3">
                            <div class="form-group">
                                <label for="txtAddress" class="form-label"><i class="fas fa-map-marker-alt"></i> Address <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Enter complete address" required></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                                    ControlToValidate="txtAddress" 
                                    ErrorMessage="Address is required" 
                                    CssClass="text-danger small d-block mt-2" 
                                    Display="None">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="form-group mt-4 d-grid gap-2 d-md-flex">
                            <asp:Button ID="btnRegister" runat="server" Text="Register Student" CssClass="btn btn-primary btn-lg" OnClick="btnRegister_Click" />
                            <asp:Button ID="btnClear" runat="server" Text="Clear Form" CssClass="btn btn-secondary btn-lg" OnClick="btnClear_Click" CausesValidation="false" OnClientClick="return clearFormFields();" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Success Modal -->
    <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true" style="z-index: 9999;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow-lg">
                <div class="modal-header bg-success text-white border-0" style="border-radius: 15px 15px 0 0; padding: 25px;">
                    <h5 class="modal-title fw-bold" id="successModalLabel">
                        <i class="fas fa-check-circle me-2"></i>Registration Successful
                    </h5>
                </div>
                <div class="modal-body" style="padding: 30px; min-height: 200px;">
                    <div id="successMessage" style="font-size: 16px; line-height: 1.8; color: #333;"></div>
                </div>
                <div class="modal-footer border-0" style="padding: 20px;">
                    <button type="button" class="btn btn-success btn-lg fw-bold" data-bs-dismiss="modal" style="min-width: 120px;">OK</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
