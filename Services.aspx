<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="services.aspx.cs" Inherits="_services" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
    <script src="scripts/ui/jquery.ui.tabs.js"></script>

    
</asp:Content>




<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
    <script>
        $(function () {
            $("#service-tabs").tabs({
                beforeLoad: function (event, ui) {
                    ui.jqXHR.error(function () {
                        ui.panel.html(
                        "Couldn't load this tab. We'll try to fix this as soon as possible. "
                        );
                    });
                }
            });
        });
</script>

     
        <div id="service-tabs">
	<ul>
		<li><a href="#tabs-1">Physiotherapy</a></li>
		<li><a href="services/lab.aspx">Laboratory</a></li>
		<li><a href="services/alternate_level_of_care.aspx">ALC</a></li>
		<li><a href="services/diagnostic_imaging.aspx">Diagnostics</a></li>
        <li><a href="services/respite_care.aspx">Respite Care</a></li>
        <li><a href="services/ontario_telemedicane.aspx">OTN</a></li>
	</ul>

            <div id="tabs-1">
                <h2>Our Services</h2>
		<p>The Nipigon District Memorial Hospital offers a variety of programs and services including  Acute and Complex Continuing Care, Emergency, Diagnostic Imaging, Laboratory,  Physiotherapy, Outpatient Clinics, etc.</p>
                <h2>Physiotherapy</h2>
                <p>The Physiotherapy Department is staffed with an Ontario Certified Physiotherapist.  The hospital provides inpatient physiotherapy services; patients are assessed and treated for various conditions such as fractures, strokes, amputations, orthopedic surgeries, sprains, musculoskeletal conditions.</p>

<p>A referral is required to access the services of the Physiotherapy department.</p> 
	</div>

    </div>
</asp:Content>


