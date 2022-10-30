<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SearchPatient.aspx.cs" Inherits="Manager.SearchPatient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control form-control-solid ps-10" name="email" value="" placeholder="Email"/>
                                </div>
                                <!--end::Input group-->
                                <!--begin:Action-->
                                <div class="col-md-6">
                                <div class="d-flex align-items-center">
                                    <br>
                                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" class="btn btn-bg-smgrey btn-color-white float-end mx-10" Text="Search"/>
                                    <a id="kt_horizontal_search_advanced_link" class="btn btn-link" data-bs-toggle="collapse" href="#kt_advanced_search_form" aria-expanded="true">Hide Advanced Search</a>
                                </div>
                                </div>
                                <!--end:Action-->
                            </div>

                        </div>
                        <!--end::Compact form-->
                        <!--begin::Advance form-->
                        <div class="collapse show" id="kt_advanced_search_form" data-select2-id="select2-data-kt_advanced_search_form" style="">
                            <!--begin::Separator-->
                            <div class="separator separator-dashed mt-9 mb-6"></div>
                            <!--end::Separator-->
                            <!--begin::Row-->
                            <div class="row g-8 mb-8" data-select2-id="select2-data-205-lbkk">
                                <!--begin::Col-->
                                <div class="col-md-6">
                                    <label class="fs-6 form-label fw-bold text-dark">Phone Number</label>
                                    <asp:TextBox ID="txtPhoneNumber" runat="server" class="form-control form-control form-control-solid" name="city" />
                                </div>
                                <!--end::Col-->
                                <!--begin::Col-->
                                <div class="col-md-6" data-select2-id="select2-data-204-g84k">
                                    <!--begin::Row-->
                                    <div class="row g-8" data-select2-id="select2-data-203-hoou">
                                        <!--begin::Col-->
                                        <div class="col-md-6">
                                            <label class="fs-6 form-label fw-bold text-dark">Registration Date</label>
                                            <!--begin::Select-->
                                            <select class="form-select form-select-solid select2-hidden-accessible" data-control="select2" data-placeholder="In Progress" data-hide-search="true" data-select2-id="select2-data-10-usqa" tabindex="-1" aria-hidden="true" data-kt-initialized="1">
                                                <option value="" data-select2-id="select2-data-207-1f9c"></option>
                                                <option value="1" data-select2-id="select2-data-208-9hk7">Not started</option>
                                                <option value="2" selected="selected" data-select2-id="select2-data-12-mjtv">Select Date</option>
                                                <option value="3" data-select2-id="select2-data-209-g7bq">Done</option>
                                            </select><span class="select2 select2-container select2-container--bootstrap5 select2-container--below" dir="ltr" data-select2-id="select2-data-11-cxj9" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single form-select form-select-solid" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-4rex-container" aria-controls="select2-4rex-container"><span class="select2-selection__rendered" id="select2-4rex-container" role="textbox" aria-readonly="true" title="In Progress">Start Date</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                            <!--end::Select-->
                                        </div>
                                        <!--end::Col-->
                                        <!--begin::Col-->
                                        <div class="col-md-6" style="padding-top: 6px;">
                                            <label class="fs-6 form-label fw-bold text-dark"></label>
                                            <!--begin::Radio group-->
                                            <select class="form-select form-select-solid select2-hidden-accessible" data-control="select2" data-placeholder="In Progress" data-hide-search="true" data-select2-id="select2-data-10-usqa" tabindex="-1" aria-hidden="true" data-kt-initialized="1">
                                                <option value="" data-select2-id="select2-data-207-1f9c"></option>
                                                <option value="1" data-select2-id="select2-data-208-9hk7">Not started</option>
                                                <option value="2" selected="selected" data-select2-id="select2-data-12-mjtv">Select Date</option>
                                                <option value="3" data-select2-id="select2-data-209-g7bq">Done</option>
                                            </select><span class="select2 select2-container select2-container--bootstrap5 select2-container--below" dir="ltr" data-select2-id="select2-data-11-cxj9" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single form-select form-select-solid" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-4rex-container" aria-controls="select2-4rex-container"><span class="select2-selection__rendered" id="select2-4rex-container" role="textbox" aria-readonly="true" title="In Progress">End Date</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                            <!--end::Radio group-->
                                        </div>
                                        <!--end::Col-->
                                    </div>
                                    <!--end::Row-->
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Row-->


                            <!--begin::Row-->

                            <!--end::Row-->
                        </div>
                        <!--end::Advance form-->
                    </div>
                    <!--end::Card body-->
                </div>
                <!--end::Card-->
            </form>
        </div>
    </div>
</div>

<!--begin::First Container-->


<div class="container">
    <asp:Button ID="btnAddNewDoctor" runat="server" OnClick="btnAddNewDoctor_Click" class="btn btn-bg-smorange btn-color-white float-end mx-2" style="border-radius: 14px" Text="Add New Doctor" />
</div>

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
                                        <span class="card-label fw-bold fs-1 mb-1">All Doctors</span>
                                    </h3>

                                </div>
                                <!--end::Header-->
                                <!--begin::Body-->
                                    <div class="table-responsive px-8">
                                        <table class="table table-striped border table-row-bordered table-row-gray-1000 border gy-7 gs-7">
                                            <thead style="background-color: #366687;">
                                            <tr class="fw-semibold fs-6 text-white border-bottom border-gray-200">
                                                <th>Status</th>
                                                <th>Full Name</th>
                                                <th>Date of Birth</th>
                                                <th>Phone Number</th>
                                                <th>Email</th>
                                                <th>Address</th>
                                                <th>Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><input class="form-check-input me-3" type="checkbox" name="email-preferences[]" value="1"></td>
                                                <td>Nabi Ahmed</td>
                                                <td>23-03-1998</td>
                                                <td>514-655-1234</td>
                                                <td>nabi123@gmail.com</td>
                                                <td>1145- 1209 Rue Mackay</td>
                                                <td><a href="#" class="me-2">Edit</a> <a href="#">Delete</a></td>
                                            </tr>
                                            <tr>
                                                <td><input class="form-check-input me-3" type="checkbox" name="email-preferences[]" value="1"></td>
                                                <td>Nabi Ahmed</td>
                                                <td>23-03-1998</td>
                                                <td>514-655-1234</td>
                                                <td>nabi123@gmail.com</td>
                                                <td>1145- 1209 Rue Mackay</td>
                                                <td><a href="#" class="me-2">Edit</a> <a href="#">Delete</a></td>
                                            </tr>
                                            <tr>
                                               <td><input class="form-check-input me-3" type="checkbox" name="email-preferences[]" value="1"></td>
                                                <td>Nabi Ahmed</td>
                                                <td>23-03-1998</td>
                                                <td>514-655-1234</td>
                                                <td>nabi123@gmail.com</td>
                                                <td>1145- 1209 Rue Mackay</td>
                                                <td><a href="#" class="me-2">Edit</a> <a href="#">Delete</a></td>
                                            </tr>
                                            <tr>
                                               <td><input class="form-check-input me-3" type="checkbox" name="email-preferences[]" value="1"></td>
                                                <td>Nabi Ahmed</td>
                                                <td>23-03-1998</td>
                                                <td>514-655-1234</td>
                                                <td>nabi123@gmail.com</td>
                                                <td>1145- 1209 Rue Mackay</td>
                                                <td><a href="#" class="me-2">Edit</a> <a href="#">Delete</a></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>


                                <!--end::Body-->
                            </div>
                            <!--end::Search Engine Fourth Container-->


                        </div>
                    </div>
                    <!--end::Post-->
                </div>
                <!--end::Container-->
    </asp:Content>