﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddDoctor.aspx.cs" Inherits="Manager.AddDoctor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:UpdatePanel ID="updatepanel" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hdfDoctorId" runat="server" />
<!--begin::First Container-->
<div id="kt_content_container" class="d-flex flex-column-fluid align-items-start container-xxl">
  <!--begin::Post-->
  <div class="content flex-row-fluid pb-1" id="kt_content">

    <div class="col-xl-12">
      <!--begin::Search Engine Fourth Container-->
      <div class="card mb-10">
        <!--begin::Header-->
        <div class="card-header border-0 pt-5">
          <h3 class="card-title align-items-start flex-column">
            <span class="card-label fw-bold fs-1 mb-1">Add New Doctor</span>
          </h3>
        </div>
        <!--end::Header-->
        <!--begin::Body-->
        <div class="container">
             <div class="input-group mb-5">
                                    <span class="input-group-text" id="basic-addon3" style="width: 18%">Registration Number</span>
                                    <asp:TextBox ID="txtRegistrationNumber" runat="server" class="form-control" aria-describedby="basic-addon3"  />
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtRegistrationNumber" ErrorMessage="Registration Number Required!" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
          <!--begin::Input group-->
          <div class="input-group mb-5">
            <span class="input-group-text" id="basic-addon3" style="width: 18%">Full Name</span>
            <asp:TextBox ID="txtFullName" runat="server" class="form-control" aria-describedby="basic-addon3"/>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtFullName" ErrorMessage="Full Name Required!" ForeColor="Red"></asp:RequiredFieldValidator>
          </div>
          <!--end::Input group-->

          <!--begin::Input group-->
          <div class="input-group mb-5">
            <span class="input-group-text" id="basic-addon3" style="width: 18%">Email</span>
            <asp:TextBox ID="txtEmail" runat="server" class="form-control" aria-describedby="basic-addon3"/>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="Email Required!" ForeColor="Red"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" Display="Dynamic" ForeColor="Red" ValidationExpression="[\w-\.]+@([\w-]+\.)+[\w-]{2,4}" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
          </div>
          <!--end::Input group-->

          <!--begin::Input group-->
          <div class="input-group mb-5">
            <span class="input-group-text" id="basic-addon3" style="width: 18%">Address</span>
            <asp:TextBox ID="txtAddress" runat="server" class="form-control" aria-describedby="basic-addon3"/>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="txtAddress" ErrorMessage="Address Required!" ForeColor="Red"></asp:RequiredFieldValidator>
          </div>
          <!--end::Input group-->

          <!--begin::Input group-->
          <div class="input-group mb-5">
            <span class="input-group-text" id="basic-addon3" style="width: 18%">Postcode</span>
            <asp:TextBox ID="txtPostcode" runat="server" class="form-control"  aria-describedby="basic-addon3"/>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ControlToValidate="txtPostcode" ErrorMessage="Postal Code Required!" ForeColor="Red"></asp:RequiredFieldValidator>
          </div>
          <!--end::Input group-->

            <!--begin::Input group-->
            <div class="input-group mb-5">
                <span class="input-group-text" id="basic-addon3" style="width: 18%">Phone Number</span>
                <asp:TextBox ID="txtPhoneNumber" runat="server" class="form-control" aria-describedby="basic-addon3"/>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator8" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number Required!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <!--end::Input group-->

          <!--begin::Input group-->
          <div class="input-group mb-5">
            <span class="input-group-text" id="txtBirthDatespan" style="width: 18%">Date of Birth</span>
            <asp:TextBox ID="txtDateofBirth" runat="server" class="form-control" TextMode="Date" aria-describedby="birthDate"/>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" ControlToValidate="txtDateofBirth" ErrorMessage="Date of Birth Required!" ForeColor="Red"></asp:RequiredFieldValidator>
          </div>
          <!--end::Input group-->
          <!--begin::Input group-->
               <asp:Panel ID="pnlPassword" runat="server">
          <div class="input-group mb-5">
            <span class="input-group-text" id="basic-addon3" style="width: 18%">Password</span>
            <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" AutoCompleteType="None" aria-describedby="basic-addon3"/>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator10" ControlToValidate="txtPassword" ErrorMessage="Password Required!" ForeColor="Red"></asp:RequiredFieldValidator>
          </div>

            <div class="input-group mb-5">
                <span class="input-group-text" id="basic-addon3" style="width: 18%">Confirm Password</span>
                <asp:TextBox ID="txtConfirmPassword" runat="server" class="form-control" TextMode="Password" AutoCompleteType="None" aria-describedby="basic-addon3"/>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator11" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="Please Confirm Password!" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cv" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" Operator="Equal" ErrorMessage="Passwords Does not Match!" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
            </div>

</asp:Panel>
              <div class="input-group mb-5">
                                    <span class="input-group-text" id="txtBirthDatespan" style="width: 18%">Approval Date</span>
                                    <asp:TextBox ID="txtRegistrationApprovalDate" runat="server" class="form-control" aria-describedby="birthDate" Enabled="false"/>
                                </div>

            <div class="input-group mb-5">
                <span class="fw-bold fs-3"  id="basic-addon3" style="width: 18%; text-align: center;">Approved</span>
                <asp:CheckBox runat="server" ID="chkApproved" class="form-check-input me-3" />

            </div>

                <br />
            <div class="mb-5">
               
                <asp:Label ID="lblFeedback" runat="server" class=""  aria-describedby="basic-addon3"/>
            </div>
          <!--end::Input group-->
        </div>
        <!--end::Body-->
      </div>
      <!--end::Search Engine Fourth Container-->
    </div>
  </div>
  <!--end::Post-->
</div>
<!--end::Container-->

<div style="text-align: center">
  <asp:Button ID="btnAddDoctor" runat="server" OnClick="btnAddDoctor_Click" class="btn btn-bg-smorange btn-color-white mb-13" Text="Add Doctor"/>
</div>
<!--end::Actions-->




<script>
    $("#txtBirthDate").flatpickr();
</script>
            </ContentTemplate>
         </asp:UpdatePanel>
</asp:Content>
