<%@ Page Title="Subject Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubjectRegistration.aspx.cs" Inherits="StudentRegistrationSystem.SubjectRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-lg-9 col-md-11">
                <div class="card shadow-lg">
                    <div class="card-header bg-success text-white">
                        <h3 class="mb-0"><i class="fas fa-book"></i> Subject Registration</h3>
                        <p class="small mt-2 mb-0">Enroll students in available subjects</p>
                    </div>
                    <div class="card-body p-4">
                        <asp:Label ID="lblMessage" runat="server" CssClass="alert" Visible="false"></asp:Label>

                        <!-- Selection Section -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <div class="form-group">
                                    <label for="ddlStudent" class="form-label"><i class="fas fa-user-graduate"></i> Select Student <span class="text-danger">*</span></label>
                                    <asp:DropDownList ID="ddlStudent" runat="server" CssClass="form-select form-select-lg" AutoPostBack="true" OnSelectedIndexChanged="ddlStudent_SelectedIndexChanged">
                                        <asp:ListItem Value="">-- Select Student --</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvStudent" runat="server" 
                                        ControlToValidate="ddlStudent" 
                                        ErrorMessage="Please select a student" 
                                        CssClass="text-danger small d-block mt-2" 
                                        Display="Dynamic"
                                        InitialValue="">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <div class="form-group">
                                    <label for="ddlSubject" class="form-label"><i class="fas fa-graduation-cap"></i> Select Subject <span class="text-danger">*</span></label>
                                    <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-select form-select-lg">
                                        <asp:ListItem Value="">-- Select Subject --</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvSubject" runat="server" 
                                        ControlToValidate="ddlSubject" 
                                        ErrorMessage="Please select a subject" 
                                        CssClass="text-danger small d-block mt-2" 
                                        Display="Dynamic"
                                        InitialValue="">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="form-group mt-4 d-grid gap-2 d-md-flex">
                            <asp:Button ID="btnEnroll" runat="server" Text="Enroll Student" CssClass="btn btn-success btn-lg" OnClick="btnEnroll_Click" />
                            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-outline-secondary btn-lg" OnClick="btnClear_Click" CausesValidation="false" />
                        </div>

                        <hr class="my-4" />

                        <!-- Add New Subject Section -->
                        <h5 class="mb-3"><i class="fas fa-plus"></i> Add New Subject</h5>
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <div class="form-group">
                                    <label for="txtSubjectCode" class="form-label"><i class="fas fa-hashtag"></i> Subject Code <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtSubjectCode" runat="server" CssClass="form-control form-control-lg" Placeholder="e.g., CS101"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5 mb-3">
                                <div class="form-group">
                                    <label for="txtSubjectName" class="form-label"><i class="fas fa-book"></i> Subject Name <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtSubjectName" runat="server" CssClass="form-control form-control-lg" Placeholder="e.g., Introduction to Computer Science"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <div class="form-group">
                                    <label for="txtCredits" class="form-label"><i class="fas fa-credit-card"></i> Credits <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtCredits" runat="server" CssClass="form-control form-control-lg" Placeholder="e.g., 3" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Add Subject Button -->
                        <div class="form-group mt-2 d-grid gap-2 d-md-flex">
                            <asp:Button ID="btnAddSubject" runat="server" Text="Add Subject" CssClass="btn btn-primary btn-lg" OnClick="btnAddSubject_Click" CausesValidation="false" />
                            <asp:Button ID="btnClearSubject" runat="server" Text="Clear Fields" CssClass="btn btn-outline-secondary btn-lg" OnClick="btnClearSubject_Click" CausesValidation="false" />
                        </div>

                        <hr class="my-4" />

                        <!-- Enrollments Section -->
                        <asp:Panel ID="pnlEnrollments" runat="server" Visible="false">
                            <h5 class="mb-3"><i class="fas fa-list"></i> Current Enrollments</h5>
                            <div class="table-responsive">
                                <asp:GridView ID="gvEnrollments" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="SubjectCode" HeaderText="Code" ItemStyle-Width="80px" />
                                        <asp:BoundField DataField="SubjectName" HeaderText="Subject Name" />
                                        <asp:BoundField DataField="Credits" HeaderText="Credits" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="EnrollmentDate" HeaderText="Enrolled Date" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="130px" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-Width="100px" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div class="alert alert-info"><i class="fas fa-info-circle"></i> No enrollments found for this student yet.</div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
