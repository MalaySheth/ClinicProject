<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SearchDoctorsAppointments.aspx.cs" Inherits="Manager.SearchDoctorsAppointments" %>
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
                    <!--begin::Advance form-->
                    <div class="collapse show" id="kt_advanced_search_form" data-select2-id="select2-data-kt_advanced_search_form" style="">
                        <div class="col-md-6 my-3" >
                            <label class="form-label">Doctor</label>
                            <!--begin::Radio group-->
                            <asp:DropDownList ID="ddlDoctors" DataTextField="FullName" DataValueField="DoctorsId" runat="server" class="form-select" AppendDataBoundItems="true">
                                <asp:ListItem Text="All" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                           
                            <!--end::Radio group-->
                        </div>
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
                <!--end::Card-->
              </form>
            </div>
          </div>
        </div>
</asp:Content>
