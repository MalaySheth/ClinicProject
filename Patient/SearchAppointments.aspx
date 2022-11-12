<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="SearchAppointments.aspx.cs" Inherits="Patient.SearchAppointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
          
            <!--begin::Style-->
             <style type="text/css">
        .pagination-ys {
            /*display: inline-block;*/
            padding-left: 0;
            margin: 20px 0;
            border-radius: 4px;
        }



            .pagination-ys table > tbody > tr > td {
                display: inline;
            }

                .pagination-ys table > tbody > tr > td > a,
                .pagination-ys table > tbody > tr > td > span {
                    position: relative;
                    float: left;
                    padding: 8px 12px;
                    line-height: 1.42857143;
                    text-decoration: none;
                    color: #dd4814;
                    background-color: #ffffff;
                    border: 1px solid #dddddd;
                    margin-left: -1px;
                }

                .pagination-ys table > tbody > tr > td > span {
                    position: relative;
                    float: left;
                    padding: 8px 12px;
                    line-height: 1.42857143;
                    text-decoration: none;
                    margin-left: -1px;
                    z-index: 2;
                    color: #aea79f;
                    background-color: #f5f5f5;
                    border-color: #dddddd;
                    cursor: default;
                }

                .pagination-ys table > tbody > tr > td:first-child > a,
                .pagination-ys table > tbody > tr > td:first-child > span {
                    margin-left: 0;
                    border-bottom-left-radius: 4px;
                    border-top-left-radius: 4px;
                }

                .pagination-ys table > tbody > tr > td:last-child > a,
                .pagination-ys table > tbody > tr > td:last-child > span {
                    border-bottom-right-radius: 4px;
                    border-top-right-radius: 4px;
                }

                .pagination-ys table > tbody > tr > td > a:hover,
                .pagination-ys table > tbody > tr > td > span:hover,
                .pagination-ys table > tbody > tr > td > a:focus,
                .pagination-ys table > tbody > tr > td > span:focus {
                    color: #97310e;
                    background-color: #eeeeee;
                    border-color: #dddddd;
                }
    </style>
             <!--end::Style-->


            <!--begin::First Container-->
            <div id="kt_content_container" class="d-flex flex-column-fluid align-items-start container-xxl">
                <!--begin::Post-->
                <div class="content flex-row-fluid" id="kt_content">
                    <div class="col-xl-12">
                        <form action="#">
                            <!--begin::Card-->
                            <div class="card mb-2">
                                <!--begin::Card body-->
                                <div class="card-body">
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
                                                <asp:TextBox ID="txtDateFrom" runat="server" TextMode="Date" class="form-control form-control-solid ps-10" name="name" value="" placeholder="From"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6 position-relative">

                                                <!--begin::Svg Icon | path: icons/duotune/general/gen021.svg-->
                                                <span class="svg-icon svg-icon-3 svg-icon-gray-500 position-absolute top-50 translate-middle ms-6">
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1" transform="rotate(45 17.0365 15.1223)" fill="currentColor"></rect>
                                                        <path d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z" fill="currentColor"></path>
                                                    </svg>
                                                </span>
                                                <!--end::Svg Icon-->
                                                <asp:TextBox ID="txtDateTo" TextMode="Date" runat="server" class="form-control form-control-solid ps-10" name="name" value="" placeholder="To"></asp:TextBox>
                                            </div>

                                            <!--end::Input group-->
                                            <!--begin:Action-->
                                            <div class="col-md-6">
                                                <div class="d-flex align-items-center">
                                                    <br>
                                                    <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-bg-smgrey btn-color-white float-end mx-10"  OnClick="btnSearch_Click"/>

                                                </div>
                                            </div>
                                            <!--end:Action-->
                                        </div>

                                    </div>
                                    <!--end::Compact form-->

                                </div>
                                <!--end::Card body-->
                            </div>
                            <!--end::Card-->
                        </form>
                    </div>
                </div>
            </div>

            <!--begin::First Container-->



            <!--begin::Second Container-->
            <div id="kt_content_container" class="d-flex flex-column-fluid align-items-start container-xxl">

                <!--begin::Post-->
                <div class="content flex-row-fluid" id="kt_content">

                    <div class="col-xl-12">
                        <!--begin::Search Engine Fourth Container-->
                        <div class="card mb-10">
                            <!--begin::Header-->
                            <div class="card-header border-0 py-5 ">
                                <h3 class="card-title align-items-start flex-column">
                                    <span class="card-label fw-bold fs-1 mb-1">Self Assessment Page</span>
                                </h3>

                            </div>
                            <!--end::Header-->
                            <!--begin::Body-->
                            <center>
                            <asp:GridView ID="gvPatientAppointment" runat="server" Width="90%" AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" DataKeyNames="PatientAppointmentsId" CssClass="table table-striped table-bordered nowrap paginate_button page-item active table table-striped table-bordered" AllowPaging="True" PageSize="10" OnPageIndexChanging="gvPatientAppointment_PageIndexChanging" OnSelectedIndexChanged="gvPatientAppointment_SelectedIndexChanged" EmptyDataText="No Appointments Found!">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete"  CssClass="btn btn-danger btn-outline-danger" ForeColor="Black" Enabled='<%#Eval("CounselorsNo")==null || (bool)Eval("Iscancelled")?false:true %>' />

                                                    </ItemTemplate>
                                                    
                                                </asp:TemplateField>

                                                <asp:BoundField DataField="AppointmentCode" HeaderText="Appointment Code" />
                                                <asp:BoundField DataField="Status" HeaderText="Status" />
                                                <asp:BoundField DataField="DoctorName" HeaderText="Doctor"  NullDisplayText="--"/>
                                                <asp:BoundField DataField="CounselorName" HeaderText="Counselor" NullDisplayText="--" />
                                                

                                                <asp:BoundField DataField="AppointmentDate" HeaderText="Date" DataFormatString="{0:d/MM/yyyy}"/>
                                                <asp:BoundField DataField="Appoint_Scheduled_DateTime" HeaderText="Schedule Date" DataFormatString="{0:d/MM/yyyy}" NullDisplayText="--"/>
                                                <asp:BoundField DataField="Appoint_Scheduled_DateTime" HeaderText="Schedule Time" DataFormatString="{0:hh:mm tt}" NullDisplayText="--"/>
                                                
                                                <asp:CommandField ShowSelectButton="true" SelectText="View"  ControlStyle-CssClass="btn btn-warning btn-outline-warning" /> 
                                                
                                            </Columns>
                                            <PagerStyle CssClass="pagination-ys" />
                                            <PagerSettings Mode="NextPrevious" NextPageText="Next" PreviousPageText="Prev" PageButtonCount="6" Position="Bottom" />
                                            <EditRowStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#0cb6b9" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="White" />
                                            <EmptyDataRowStyle HorizontalAlign="Center" />


                                        </asp:GridView>

                            </center>
                            <br />
                            <center>
                            <asp:Label ID="lblFeedback" runat="server"></asp:Label>
                            </center>


                            <!--end::Body-->
                        </div>
                        <!--end::Search Engine Fourth Container-->


                    </div>
                </div>
                <!--end::Post-->
            </div>
            <!--end::Container-->

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
