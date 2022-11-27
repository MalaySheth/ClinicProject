<%@ Page Title="Schedule Appointment" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="ScheduleAppointment.aspx.cs" Inherits="Doctor.ScheduleAppointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="kt_content_container" class="d-flex flex-column-fluid align-items-start container-xxl">

        <!--begin::Post-->
        <div class="content flex-row-fluid" id="kt_content">

            <div class="col-xl-12">
                <!--begin::Search Engine Fourth Container-->
                <div class="card mb-10">
                    <!--begin::Header-->
                    <div class="card-header border-0 py-5 ">
                        <h3 class="card-title align-items-start flex-column">
                            <span class="card-label fw-bold fs-2 mb-1">Schedule Appointment</span>
                        </h3>
                    </div>
                    <asp:HiddenField ID="hdfPatientAppointmentId" runat="server" />
                    <!--end::Header-->
                    <!--begin::Body-->
                    <div class="container mb-5">
                        <div class="row">
                            <div class="col">
                                <span class="fw-bold fs-5 mb-1">Patient Name:</span>
                                <span class="fw-bold fs-5 mb-1"><asp:Label ID="lblPatientName" runat="server"></asp:Label></span>
                            </div>
                            <div class="col">
                                <div class="float-end">
                                    <span class="fw-bold fs-5 mb-1">Assesment Date:</span>
                                    <span class="fw-bold fs-5 mb-1"><asp:Label ID="lblAssessmentDate" runat="server"></asp:Label></span>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="collapse show" id="kt_advanced_search_form" data-select2-id="select2-data-kt_advanced_search_form" style="">
                     
                   
                      <div class="row g-8 mb-8" data-select2-id="select2-data-205-lbkk">
                        <!--begin::Col-->
                        <div class="col-md-6">
                            <div class="mb-0">
                                <label class="form-label">Date</label>
                                <asp:TextBox  runat="server" ID="txtDate" TextMode="Date" class="form-control form-control-solid" placeholder="Pick date rage" />
                            </div>

                        </div>
                        <!--end::Col-->
                        <!--begin::Col-->
                        <div class="col-md-6">
                            <div class="mb-0">
                                <label class="form-label">Time</label>
                                <asp:TextBox ID="txtTime" runat="server" class="form-control form-control-solid" TextMode="Time" placeholder="Pick Time rage" />
                            </div>

                        </div>
                        <!--end::Col-->
                    </div>
                    <!--end::Advance form-->

                        <!--begin::Row-->
                       
                        <div class="row g-8">
                                <div style="text-align: center">
                                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="btn btn-bg-smgrey btn-color-white  mx-10 " Text="Schedule"  />
                                </div>
                            <!--end:Action-->
                        </div>
                         <div class="row g-8">
                                <div style="text-align: center">
                                   <asp:Label ID="lblFeedback" runat="server"></asp:Label>
                                </div>
                            <!--end:Action-->
                        </div>
                        </div>
                       </div>
                <!--end::Search Engine Fourth Container-->


            </div>
        </div>
        <!--end::Post-->
    </div>
</asp:Content>
