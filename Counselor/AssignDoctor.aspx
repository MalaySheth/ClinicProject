<%@ Page Title="Assign Doctor" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="AssignDoctor.aspx.cs" Inherits="Counselor.AssignDoctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="kt_content_container" class="d-flex flex-column-fluid align-items-start container-xxl">
        <!--begin::Post-->
        <div class="content flex-row-fluid" id="kt_content">
            <div class="col-xl-12">
                
                    <!--begin::Card-->
                    <div class="card mb-2">
                        <div class="card-header border-0 py-5 ">
                        <h3 class="card-title align-items-start flex-column">
                            <span class="card-label fw-bold fs-2 mb-1">Assign Doctor</span>
                        </h3>
                    </div>
                        <!--begin::Card body-->
                        <div class="card-body">
                            <div class="container mb-5">
                                <div class="row">
                                    <div class="col">
                                        <span class="fw-bold fs-5 mb-1">Patient Name:</span>
                                        <span class="fw-bold fs-5 mb-1">
                                            <asp:Label ID="lblPatientName" runat="server"></asp:Label></span>
                                    </div>
                                    <div class="col">
                                        <div class="float-end">
                                            <span class="fw-bold fs-5 mb-1">Assesment Date:</span>
                                            <span class="fw-bold fs-5 mb-1">
                                                <asp:Label ID="lblAssessmentDate" runat="server"></asp:Label></span>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            
                            <asp:HiddenField ID="hdfPatientAppointmentId" runat="server" />
                            <!--begin::Compact form-->
                            <!--                        <div class="d-flex align-items-center">-->
                            <div>
                                <div class="row g-8 mb-8">

                                    <!--begin::Input group-->
                                    <!--                             <div class="col-md-5 position-relative w-md-700px me-md-2">-->
                                    <div class="col-md-6 position-relative">

                                        <!--begin::Svg Icon | path: icons/duotune/general/gen021.svg-->
                                        <span class="svg-icon svg-icon-3 svg-icon-gray-500 position-absolute top-50 translate-middle ms-6">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1" transform="rotate(45 17.0365 15.1223)" fill="currentColor"></rect>
                                                <path d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z" fill="currentColor"></path>
                                            </svg>
                                        </span>
                                        <!--end::Svg Icon-->
                                        <asp:DropDownList ID="ddlDoctors" DataTextField="FullName" DataValueField="DoctorsId" runat="server" class="form-control form-control-solid ps-10"></asp:DropDownList>
                                        
                                    </div>
                                     <div class="col-md-6">
                                                <div class="d-flex align-items-center">
                                                    <br>
                                                    <asp:Button ID="btnAssign" runat="server" Text="Assign" class="btn btn-bg-smgrey btn-color-white float-end mx-10"  OnClick="btnAssign_Click"/>
                                                    
                                                </div>
                                            </div>
                                </div>
                                <div class="row g-8 mb-8">
                                    <asp:Label ID="lblFeedback" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>

</asp:Content>
