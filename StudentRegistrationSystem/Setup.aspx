<%@ Page Title="Database Setup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Setup.aspx.cs" Inherits="StudentRegistrationSystem.Setup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow-lg">
                    <div class="card-header bg-warning text-dark">
                        <h3 class="mb-0"><i class="fas fa-database"></i> Database Setup</h3>
                        <p class="small mt-2 mb-0">First-time setup wizard - Configure your database connection</p>
                    </div>
                    <div class="card-body p-4">
                        <asp:Label ID="lblMessage" runat="server" CssClass="alert" Visible="false"></asp:Label>

                        <!-- Step 1: Database Connection -->
                        <div class="card mb-3" id="step1Card">
                            <div class="card-header bg-light">
                                <h5 class="mb-0"><i class="fas fa-plug"></i> Step 1: Database Connection</h5>
                            </div>
                            <div class="card-body">
                                <p>Enter your SQL Server connection details:</p>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">SQL Server Instance</label>
                                        <asp:TextBox ID="txtServerName" runat="server" CssClass="form-control" placeholder="localhost or .\SQLEXPRESS"></asp:TextBox>
                                        <small class="text-muted">Default: . (local machine)</small>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Authentication</label>
                                        <asp:DropDownList ID="ddlAuth" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlAuth_SelectedIndexChanged">
                                            <asp:ListItem Value="Integrated">Windows Authentication (Default)</asp:ListItem>
                                            <asp:ListItem Value="SQL">SQL Server Authentication</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <!-- SQL Auth Fields -->
                                <div id="sqlAuthDiv" style="display: none;">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Username</label>
                                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="sa"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Password</label>
                                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="mt-3">
                                    <asp:Button ID="btnTestConnection" runat="server" Text="Test Connection" CssClass="btn btn-info" OnClick="btnTestConnection_Click" />
                                    <asp:Label ID="lblConnectionStatus" runat="server" CssClass="ms-3" Visible="false"></asp:Label>
                                </div>
                            </div>
                        </div>

                        <!-- Step 2: Create Database -->
                        <div class="card mb-3" id="step2Card">
                            <div class="card-header bg-light">
                                <h5 class="mb-0"><i class="fas fa-database"></i> Step 2: Create Database</h5>
                            </div>
                            <div class="card-body">
                                <p>Click below to create the StudentRegistrationDB database with all tables and sample data:</p>
                                <asp:Button ID="btnCreateDatabase" runat="server" Text="Create Database & Tables" CssClass="btn btn-success btn-lg" OnClick="btnCreateDatabase_Click" />
                                <asp:Label ID="lblDatabaseStatus" runat="server" CssClass="ms-3" Visible="false"></asp:Label>
                            </div>
                        </div>

                        <!-- Step 3: Create Stored Procedures -->
                        <div class="card mb-3" id="step3Card">
                            <div class="card-header bg-light">
                                <h5 class="mb-0"><i class="fas fa-cogs"></i> Step 3: Create Stored Procedures</h5>
                            </div>
                            <div class="card-body">
                                <p>Click below to create all stored procedures:</p>
                                <asp:Button ID="btnCreateStoredProcedures" runat="server" Text="Create Stored Procedures" CssClass="btn btn-success btn-lg" OnClick="btnCreateStoredProcedures_Click" />
                                <asp:Label ID="lblStoredProcStatus" runat="server" CssClass="ms-3" Visible="false"></asp:Label>
                            </div>
                        </div>

                        <!-- Step 4: Finish -->
                        <div class="card">
                            <div class="card-header bg-light">
                                <h5 class="mb-0"><i class="fas fa-check-circle"></i> Step 4: Finish Setup</h5>
                            </div>
                            <div class="card-body">
                                <p>Once all steps are complete, click below to go to the application:</p>
                                <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/Default.aspx" CssClass="btn btn-primary btn-lg"><i class="fas fa-home"></i> Go to Home Page</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Quick Reference -->
                <div class="card mt-4">
                    <div class="card-header bg-secondary text-white">
                        <h5 class="mb-0"><i class="fas fa-info-circle"></i> Quick Reference</h5>
                    </div>
                    <div class="card-body">
                        <h6>Common SQL Server Instance Names:</h6>
                        <ul>
                            <li><code>.</code> - Local machine (default)</li>
                            <li><code>localhost</code> - Local machine</li>
                            <li><code>.\SQLEXPRESS</code> - SQL Server Express</li>
                            <li><code>.\MSSQL2019</code> - Named instance</li>
                            <li><code>(localdb)\mssqllocaldb</code> - LocalDB</li>
                            <li><code>SERVER_NAME</code> - Remote server</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
