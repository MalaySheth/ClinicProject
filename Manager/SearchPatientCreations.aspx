﻿<%@ Page Title="Search Patient Registration" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SearchPatientCreations.aspx.cs" Inherits="Manager.SearchPatientCreations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!--begin::First Container-->
        <div id="kt_content_container" class="d-flex flex-column-fluid align-items-start container-xxl">
          <!--begin::Post-->
          <div class="content flex-row-fluid" id="kt_content">
            <div class="col-xl-12">
      
                <!--begin::Card-->
                <div class="card mb-2">
                  <!--begin::Card body-->
                  <div class="card-body">
                    <!--begin::Advance form-->
                    <div class="collapse show" id="kt_advanced_search_form" data-select2-id="select2-data-kt_advanced_search_form" style="">
                      
                      <!--begin::Row-->
                      <div class="row g-8 mb-8" data-select2-id="select2-data-205-lbkk">
                        <!--begin::Col-->
                          <div class="col-md-6">
                              <div class="mb-0">
                                  <label class="form-label">Date From</label>
                                   <asp:TextBox ID="txtDateFrom" runat="server" TextMode="Date" class="form-control form-control-solid"  ></asp:TextBox>
                              </div>

                          </div>
                        <!--end::Col-->
                          <!--begin::Col-->
                          <div class="col-md-6">
                              <div class="mb-0">
                                  <label class="form-label">Date To</label>
                                  <asp:TextBox ID="txtDateTo" TextMode="Date" runat="server" class="form-control form-control-solid"></asp:TextBox>
                                  
                              </div>

                          </div>
                          <!--end::Col-->
                      </div>
                      <!--end::Row-->
                        <div class="row g-8 mb-8 mx-0">
                            <!--begin:Action-->
                                <div class="float-end">
                                    <asp:Button ID="btnPrint" runat="server" OnClick="btnPrint_Click" class="btn btn-bg-smgrey btn-color-white float-end mx-0" Text="Print" />
                                </div>
                            <!--end:Action-->
                        </div>

                    </div>
                    <!--end::Advance form-->
                  </div>
                  <!--end::Card body-->
                </div>
           
            </div>
          </div>
        </div>
</asp:Content>