<%@ Page Title="View Students" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewStudents.aspx.cs" Inherits="StudentRegistrationSystem.ViewStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5">
        <div class="row">
            <div class="col-12">
                <div class="card shadow-lg">
                    <div class="card-header bg-info text-white">
                        <div class="d-flex justify-content-between align-items-center">
                            <h3 class="mb-0"><i class="fas fa-users"></i> Registered Students</h3>
                            <asp:Button ID="btnRefresh" runat="server" Text="Refresh" CssClass="btn btn-light btn-sm" OnClick="btnRefresh_Click" />
                        </div>
                    </div>
                    <div class="card-body p-4">
                        <asp:Label ID="lblMessage" runat="server" CssClass="alert" Visible="false"></asp:Label>

                        <div class="table-responsive">
                            <asp:GridView ID="gvStudents" runat="server" 
                                CssClass="table table-striped table-bordered table-hover" 
                                AutoGenerateColumns="false" 
                                AllowPaging="true" 
                                PageSize="10" 
                                OnPageIndexChanging="gvStudents_PageIndexChanging">
                                <Columns>
                                    <asp:BoundField DataField="StudentID" HeaderText="ID" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="FirstName" HeaderText="First Name" ItemStyle-Width="120px" />
                                    <asp:BoundField DataField="LastName" HeaderText="Last Name" ItemStyle-Width="120px" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" />
                                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone" ItemStyle-Width="120px" />
                                    <asp:BoundField DataField="RegistrationDate" HeaderText="Registered" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="EnrolledSubjects" HeaderText="Subjects" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <div class="alert alert-warning mt-3"><i class="fas fa-exclamation-triangle"></i> No students registered yet.</div>
                                </EmptyDataTemplate>
                                <PagerStyle CssClass="pagination mt-3" HorizontalAlign="Center" />
                                <PagerSettings FirstPageText="<i class='fas fa-chevron-left'></i>" LastPageText="<i class='fas fa-chevron-right'></i>" Mode="NumericFirstLast" PageButtonCount="5" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
