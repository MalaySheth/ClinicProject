<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Counselor.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>MediPlus</title>
    <meta charset="utf-8" />
    <meta name="description" content="The most advanced Bootstrap Admin Theme on Themeforest trusted by 100,000 beginners and professionals. Multi-demo, Dark Mode, RTL support and complete React, Angular, Vue, Asp.Net Core, Blazor, Django, Flask & Laravel versions. Grab your copy now and get life-time updates for free." />
    <meta name="keywords" content="metronic, bootstrap, bootstrap 5, angular, VueJs, React, Asp.Net Core, Blazor, Django, Flask & Laravel starter kits, admin themes, web design, figma, web development, free templates, free admin themes, bootstrap theme, bootstrap template, bootstrap dashboard, bootstrap dak mode, bootstrap button, bootstrap datepicker, bootstrap timepicker, fullcalendar, datatables, flaticon" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta property="og:locale" content="en_US" />
    <meta property="og:type" content="article" />
    <meta property="og:title" content="Metronic | Bootstrap HTML, VueJS, React, Angular, Asp.Net Core, Blazor, Django, Flask & Laravel Admin Dashboard Theme" />
    <meta property="og:url" content="https://keenthemes.com/metronic" />
    <meta property="og:site_name" content="Keenthemes | Metronic" />
    <link rel="canonical" href="https://preview.keenthemes.com/metronic8" />
    <link rel="shortcut icon" href="assets/media/logos/favicon.ico" />
    <!--begin::Fonts-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700" />
    <!--end::Fonts-->
    <!--begin::Global Stylesheets Bundle(used by all pages)-->
    <link href="assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
    <!--end::Global Stylesheets Bundle-->
</head>
<body class="app-blank bgi-size-cover bgi-position-center bgi-no-repeat">
    <script>var defaultThemeMode = "light"; var themeMode; if (document.documentElement) { if (document.documentElement.hasAttribute("data-theme-mode")) { themeMode = document.documentElement.getAttribute("data-theme-mode"); } else { if (localStorage.getItem("data-theme") !== null) { themeMode = localStorage.getItem("data-theme"); } else { themeMode = defaultThemeMode; } } if (themeMode === "system") { themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"; } document.documentElement.setAttribute("data-theme", themeMode); }</script>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <!--end::Theme mode setup on page load-->
        <!--begin::Main-->
        <asp:UpdatePanel ID="UpdatePanel" runat="server">
            <ContentTemplate>
            <!--begin::Root-->
            <div class="d-flex flex-column flex-root">
                <!--begin::Page bg image-->
                <style>
                    body {
                        background-image: url('assets/media/auth/bg10.jpeg');
                    }

                    [data-theme="dark"] body {
                        background-image: url('assets/media/auth/bg10-dark.jpeg');
                    }
                </style>
                <!--end::Page bg image-->
                <!--begin::Authentication - Sign-up -->
                <div class="d-flex flex-column flex-lg-row flex-column-fluid">
                    <!--begin::Aside-->
                    <div class="d-flex flex-lg-row-fluid">
                        <!--begin::Content-->
                        <div class="d-flex flex-column flex-center pb-0 pb-lg-10 p-10 w-100">
                            <!--begin::Image-->
                            <img class="theme-light-show mx-auto mw-100 w-150px w-lg-300px mb-10 mb-lg-20" src="assets/media/auth/ill_walk.png" alt="" />
                            <img class="theme-dark-show mx-auto mw-100 w-150px w-lg-300px mb-10 mb-lg-20" src="assets/media/auth/agency-dark.png" alt="" />
                            <!--end::Image-->
                            <!--begin::Title-->
                            <h1 class="text-gray-800 fs-2qx fw-bold text-center mb-7">Get an online doctor consultation in minutes</h1>
                            <!--end::Title-->
                            <!--begin::Text-->
                            <div class="text-gray-600 fs-base text-center fw-semibold">
                                In this kind of post,
							Connect with doctors online 24/7 and get a diagnosis or prescription in minutes — 91% of medical issues are fully resolved after one visit. With over 350,000 reviews, Canadians coast to coast continue to trust Maple.
                            </div>
                            <!--end::Text-->
                        </div>
                        <!--end::Content-->
                    </div>
                    <!--begin::Aside-->
                    <!--begin::Body-->
                    <div class="d-flex flex-column-fluid flex-lg-row-auto justify-content-center justify-content-lg-end p-12">
                        <!--begin::Wrapper-->
                        <div class="bg-body d-flex flex-center rounded-4 w-md-600px p-10">
                            <!--begin::Content-->
                            <div class="w-md-400px">
                                <!--begin::Form-->
                                <form class="form w-100" novalidate="novalidate" id="kt_sign_up_form" data-kt-redirect-url="../../demo18/dist/authentication/layouts/overlay/sign-in.html" action="#">
                                    <!--begin::Heading-->
                                    <div class="text-center mb-11">
                                        <!--begin::Title-->
                                        <h1 class="text-dark fw-bolder mb-3">Sign Up</h1>
                                        <!--end::Title-->
                                    </div>
                                    <!--begin::Heading-->
                                     <div class="fv-row mb-8">
                                            <!--begin::Email-->
                                            <asp:TextBox ID="txtRegistrationNumber" runat="server" placeholder="Registration Number" name="name" autocomplete="off" CssClass="form-control bg-transparent"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator8" ControlToValidate="txtRegistrationNumber" ErrorMessage="RegistrationNumber Required!" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <!--end::Email-->
                                        </div>
                                    <!--begin::Input group=-->
                                    <div class="fv-row mb-8">
                                        <!--begin::Email-->
                                        <asp:TextBox ID="txtFullName" runat="server" placeholder="Full Name" name="name" autocomplete="off" CssClass="form-control bg-transparent"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rf1" ControlToValidate="txtFullName" ErrorMessage="Name Required!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <!--end::Email-->
                                    </div>
                                    <div class="fv-row mb-8">
                                        <!--begin::Email-->
                                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" name="name" autocomplete="off" CssClass="form-control bg-transparent"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="Email Required!" ForeColor="Red"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" Display="Dynamic" ForeColor="Red" ValidationExpression="[\w-\.]+@([\w-]+\.)+[\w-]{2,4}" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                        <!--end::Email-->
                                    </div>
                                    <div class="fv-row mb-8">
                                        <!--begin::Email-->
                                        <asp:TextBox ID="txtAddress" runat="server" placeholder="Address" name="name" autocomplete="off" CssClass="form-control bg-transparent"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtAddress" ErrorMessage="Address Required!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <!--end::Email-->
                                    </div>
                                    <div class="fv-row mb-8">
                                        <!--begin::Email-->
                                        <asp:TextBox ID="txtPostalcode" runat="server" placeholder="Postalcode" name="name" autocomplete="off" CssClass="form-control bg-transparent"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtPostalcode" ErrorMessage="Postal Code Required!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <!--end::Email-->
                                    </div>
                                    <div class="fv-row mb-8">
                                        <!--begin::Email-->
                                        <asp:TextBox ID="txtDateofBirth" runat="server" placeholder="Date of Birth" name="name" TextMode="Date" autocomplete="off" CssClass="form-control bg-transparent"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtDateofBirth" ErrorMessage="Birth Date Required!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <!--end::Email-->
                                    </div>
                                    <div class="fv-row mb-8">
                                        <!--begin::Email-->
                                         <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Phone number" name="name" autocomplete="off" CssClass="form-control bg-transparent"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Required!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <!--end::Email-->
                                    </div>
                                    <!--begin::Input group-->
                                    <div class="fv-row mb-8" data-kt-password-meter="true">
                                        <!--begin::Wrapper-->
                                        <div class="mb-1">
                                            <!--begin::Input wrapper-->
                                            <div class="position-relative mb-3">
                                                <asp:TextBox ID="txtPassword" runat="server"  class="form-control bg-transparent" TextMode="Password" placeholder="Password" name="password" autocomplete="off" >
                                               </asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="txtPassword" ErrorMessage="Password Required!" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                            <!--end::Input wrapper-->
                                            <!--begin::Meter-->
                                            <div class="d-flex align-items-center mb-3" data-kt-password-meter-control="highlight">
                                                <div class="flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2"></div>
                                                <div class="flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2"></div>
                                                <div class="flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2"></div>
                                                <div class="flex-grow-1 bg-secondary bg-active-success rounded h-5px"></div>
                                            </div>
                                            <!--end::Meter-->
                                        </div>
                                        <!--end::Wrapper-->
                                        <!--begin::Hint-->

                                        <!--end::Hint-->
                                    </div>
                                    <!--end::Input group=-->
                                    <!--end::Input group=-->
                                    <div class="fv-row mb-8">
                                        <!--begin::Repeat Password-->
                                        <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="Repeat Password" name="confirm-password" type="password" autocomplete="off" CssClass="form-control bg-transparent" ></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="Please Confirm Password!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="cv" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" Operator="Equal" ErrorMessage="Passwords Does not Match!" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                                         <!--end::Repeat Password-->
                                    </div>
                                    <!--end::Input group=-->
                                    <%--<!--begin::Accept-->
                                    <div class="fv-row mb-8">
                                        <label class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" name="toc" value="1" />
                                            <span class="form-check-label fw-semibold text-gray-700 fs-base ms-1">I Accept the
									
                                                <a href="#" class="ms-1 link-primary">Terms</a></span>
                                        </label>
                                    </div>
                                    <!--end::Accept-->--%>
                                    <!--begin::Submit button-->
                                    <div class="d-grid mb-10">
                                        <asp:Label ID="lblFeedback" runat="server"></asp:Label>
                                        <br />
                                        <asp:Button id="btnSignup" runat="server" OnClick="btnSignup_Click" CssClass="btn btn-primary" Text="Sign Up">
                                            
                                        </asp:Button>
                                    </div>
                                    <!--end::Submit button-->
                                    <!--begin::Sign up-->
                                    <div class="text-gray-500 text-center fw-semibold fs-6">
                                        Already have an Account?
							
                                        <a href="Login.aspx" class="link-primary fw-semibold">Sign in</a>
                                    </div>
                                    <!--end::Sign up-->
                                </form>
                                <!--end::Form-->
                            </div>
                            <!--end::Content-->
                        </div>
                        <!--end::Wrapper-->
                    </div>
                    <!--end::Body-->
                </div>
                <!--end::Authentication - Sign-up-->
            </div>
            <!--end::Root-->
                </ContentTemplate>
        </asp:UpdatePanel>
        <!--end::Main-->

        <!--begin::Javascript-->
        <script>var hostUrl = "assets/";</script>
         <script type="text/javascript">
            function HideLabel() {
                var seconds = 5;
                setTimeout(function () {
                    document.getElementById("<%=lblFeedback.ClientID %>").style.display = "none";
                }, seconds * 1000);
            };
        </script>
        <!--begin::Global Javascript Bundle(used by all pages)-->
        <script src="assets/plugins/global/plugins.bundle.js"></script>
        <script src="assets/js/scripts.bundle.js"></script>
        <!--end::Global Javascript Bundle-->
        <!--begin::Custom Javascript(used by this page)-->
        <script src="assets/js/custom/authentication/sign-up/general.js"></script>
        <!--end::Custom Javascript-->
        <!--end::Javascript-->
    </form>
</body>
</html>
