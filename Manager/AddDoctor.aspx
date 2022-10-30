<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddDoctor.aspx.cs" Inherits="Manager.AddDoctor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
          <!--begin::Input group-->
          <div class="input-group mb-5">
            <span class="input-group-text" id="basic-addon3" style="width: 18%">Full Name</span>
            <asp:TextBox ID="txtFullName" runat="server" class="form-control" aria-describedby="basic-addon3"/>
          </div>
          <!--end::Input group-->

          <!--begin::Input group-->
          <div class="input-group mb-5">
            <span class="input-group-text" id="basic-addon3" style="width: 18%">Email</span>
            <asp:TextBox ID="txtEmail" runat="server" class="form-control" aria-describedby="basic-addon3"/>
          </div>
          <!--end::Input group-->

          <!--begin::Input group-->
          <div class="input-group mb-5">
            <span class="input-group-text" id="basic-addon3" style="width: 18%">Address</span>
            <asp:TextBox ID="txtAddress" runat="server" class="form-control" aria-describedby="basic-addon3"/>
          </div>
          <!--end::Input group-->

          <!--begin::Input group-->
          <div class="input-group mb-5">
            <span class="input-group-text" id="basic-addon3" style="width: 18%">Postcode</span>
            <asp:TextBox ID="txtPostcode" runat="server" class="form-control"  aria-describedby="basic-addon3"/>
          </div>
          <!--end::Input group-->

            <!--begin::Input group-->
            <div class="input-group mb-5">
                <span class="input-group-text" id="basic-addon3" style="width: 18%">Phone Number</span>
                <asp:TextBox ID="txtPhoneNumber" runat="server" class="form-control" aria-describedby="basic-addon3"/>
            </div>
            <!--end::Input group-->

          <!--begin::Input group-->
          <div class="input-group mb-5">
            <span class="input-group-text" id="txtBirthDatespan" style="width: 18%">Date of Birth</span>
            <asp:TextBox ID="txtDateofBirth" runat="server" class="form-control" aria-describedby="birthDate"/>
          </div>
          <!--end::Input group-->
          <!--begin::Input group-->
          <div class="input-group mb-5">
            <span class="input-group-text" id="basic-addon3" style="width: 18%">Password</span>
            <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" AutoCompleteType="None" aria-describedby="basic-addon3"/>
          </div>

            <div class="input-group mb-5">
                <span class="input-group-text" id="basic-addon3" style="width: 18%">Confirm Password</span>
                <asp:TextBox ID="txtConfirmPassword" runat="server" class="form-control" TextMode="Password" AutoCompleteType="None" aria-describedby="basic-addon3"/>
            </div>


            <div class="input-group mb-5">
                <span class="input-group-text" id="basic-addon3" style="width: 18%">Creation Date</span>
                <asp:TextBox ID="txtCreationDate" runat="server" class="form-control" aria-describedby="basic-addon3"/>
            </div>

            <div class="input-group mb-5">
                <span class="input-group-text" id="basic-addon3" style="width: 18%">Registration Approval Date</span>
                <asp:TextBox ID="txtRegistrationApprovalDate" runat="server" class="form-control" aria-describedby="basic-addon3"/>
            </div>

            <div class="input-group mb-5">
                <span clas="fw-bold fs-3"  id="basic-addon3" style="width: 18%; text-align: center;">Approved</span>
                <asp:CheckBox runat="server" ID="checkboxApproved" class="form-check-input me-3" OnCheckedChanged="checkboxApproved_CheckedChanged" name="email-preferences[]" value="1"/>

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
</asp:Content
