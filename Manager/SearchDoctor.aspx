﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SearchDoctor.aspx.cs" Inherits="Manager.SearchDoctor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
<!--begin::First Container-->
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
                                    <asp:TextBox ID="txtRegistrationNumber" runat="server" class="form-control form-control-solid ps-10" name="email" value="" placeholder="Registration Number" />
                                    <br /> 
                                    <asp:Label ID="lblFeedback" runat="server"></asp:Label>
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
                                    <label class="fs-6 form-label fw-bold text-dark">Name</label>
                                    <asp:TextBox ID="txtName" runat="server" class="form-control form-control form-control-solid" name="city" />
                                </div>
                                <!--end::Col-->
                                <!--begin::Col-->
                                <div class="col-md-6">
                                    <label class="fs-6 form-label fw-bold text-dark">Phone Number</label>
                                    <asp:TextBox ID="txtPhoneNumber" runat="server" class="form-control form-control form-control-solid" name="city" />
                                </div>
                                <div class="col-md-6">
                                    <label class="fs-6 form-label fw-bold text-dark">Email</label>
                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control form-control form-control-solid" name="city" />
                                </div>
                                <!--end::Col-->
                                <!--begin::Col-->
                                <div class="col-md-6">
                                    <label class="fs-6 form-label fw-bold text-dark">Address</label>
                                    <asp:TextBox ID="txtAddress" runat="server" class="form-control form-control form-control-solid" name="city" />
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
    <a href="AddDoctor.aspx" class="btn btn-bg-smorange btn-color-white float-end mx-2" style="border-radius: 14px" >Add New Doctor</a>
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
                                    <%--<div class="table-responsive px-8">
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
                                    </div>--%>

                                <asp:GridView ID="gvDoctors" runat="server" AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" DataKeyNames="DoctorsId" CssClass="table table-striped table-bordered nowrap paginate_button page-item active table table-striped table-bordered" AllowPaging="True" PageSize="10" OnPageIndexChanging="gvDoctors_PageIndexChanging" OnSelectedIndexChanged="gvDoctors_SelectedIndexChanged" EmptyDataText="No Doctors Found!">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Button ID="btnDeleteDoctors" runat="server" OnClick="btnDeleteDoctors_Click" Text="Delete"  CssClass="btn btn-danger btn-outline-danger" ForeColor="Black" />

                                                    </ItemTemplate>
                                                    
                                                </asp:TemplateField>
                                                
                                                <asp:CheckBoxField DataField="IsApproved" HeaderText="Approved" />
                                               <asp:BoundField DataField="RegistrationNumber" HeaderText="Registration Number" />
                                                <asp:BoundField DataField="FullName" HeaderText="Name" />
                                                <asp:BoundField DataField="Adress" HeaderText="Address" />
                                                <asp:BoundField DataField="creation_datetime" HeaderText="Creation Date" DataFormatString="{0:d/MM/yyyy}"/>
                                                <asp:CommandField ShowSelectButton="true" SelectText="Edit"  ControlStyle-CssClass="btn btn-success btn-outline-success" /> 
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Button ID="btnUpdateApprove" runat="server" OnClick="btnUpdateApprove_Click" Text='<%# ((bool)Eval("IsApproved") ? "Unapprove":"Approve")%>' CssClass="btn btn-primary btn-outline-primary" ForeColor="Black" />

                                                    </ItemTemplate>
                                                    
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle CssClass="pagination-ys" />
                                            <PagerSettings Mode="NextPrevious" NextPageText="Next" PreviousPageText="Prev" PageButtonCount="6" Position="Bottom" />
                                            <EditRowStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#0cb6b9" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="White" />
                                            <EmptyDataRowStyle HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                                        </asp:GridView>
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
