function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}

function changeView(param) {
	var a = getContextPath();
	if (param == 'integratedQALab') {
		window.location.href = a + '/integratedQALabs/integratedQALab.jsp';
	} else if (param == 'digitalQAService') {
		window.location.href = a + '/digitalQAService/digitalQAService.jsp';
	} else if (param == 'continuousDelivery') {
		window.location.href = a + '/continuousDelivery/continuousDelivery.jsp';
	} else if (param == 'dashboard') {
		window.location.href = a + '/dashboardAndMonitoring/dashboard.jsp';
	}
}

function changeViewFromNav(param) {
	
	var a = getContextPath();
	if (param == 'mobile') {
		window.location.href = a
				+ '/integratedQALabs/mobileLab/deviceSelectionMatrix/marketTrends?market=1';
		// window.location.href=a+'/integratedQALabs/mobileLab/mobileLab.jsp';
		// document.getElementById('integratedQALabs').classList.remove('panel-collapse
		// collapse in');
		// document.getElementById('integratedQALabs').classList.add('panel-collapse
		// collapse in');
		$(document).ready(function() {
			$("#integratedQALabs").addClass("panel-collapse collapse in");
		});
	} else if (param == 'cloud') {
		window.location.href = a + '/common/WorkInProgress.jsp';
		// window.location.href=a+'/integratedQALabs/cloudTesting/cloud-testing.jsp';
	} else if (param == 'iot') {
		window.open("https://partners.perfectomobile.com/");
		// window.location.href=a+'/console/runHome?toolName=Cafe_Perfecto';
		// window.location.href=a+'/integratedQALabs/iot/iot.jsp';
	} else if (param == 'paymentDevice') {
		window.location.href = a + '/common/WorkInProgress.jsp';
		// window.location.href=a+'/integratedQALabs/paymentDevice/paymentDevice.jsp';
	} else if (param == 'userExperienceAnalytics') {
		window.location.href = a
				+ '/digitalQAService/userExperienceTesting/analytics/integrated.jsp';
		/* window.location.href=a+'/digitalQAService/userExperienceTesting/userExperienceTesting.jsp'; */
	} else if (param == 'sentimentAnalytics') {
		window.location.href = a
				+ '/digitalQAService/userExperienceTesting/sentiment/detailReport.jsp';
	} else if (param == 'accessibilityTesting') {
		window.location.href = a
				+ '/digitalQAService/accessibilityTesting/viewAllocatedBatch';

	} else if (param == 'userFeedbackTesting') {
		window.location.href = a+ '/digitalQAService/crowdSourcing';

	} else if (param == 'socialMediaSentiment') {
		window.location.href = a+ '/digitalQAService/socialMediaSentiment/socialMediaSentiment.jsp';

	}
	else if (param == 'mobileAppsTesting') {
		/* window.location.href=a+'/digitalQAService/mobileAppTesting/mobileAppTesting.jsp'; */
		/* window.location.href=a+'/common/WorkInProgress.jsp'; */
		window.location.href = a
				+ '/integratedQALabs/mobileLab/deviceSelectionMatrix/marketTrends?market=1';
	} else if (param == 'crossBrowserTesting') {
		/* window.location.href=a+'/digitalQAService/crossBrowserTesting/crossBrowserTesting.jsp'; */
		/* window.open("http://in-pnq-coe19:8081/OPTIK/landing"); */
		window.open("https://www.browserstack.com/");
	} else if (param == 'mobileCertificationTesting') {
		/* window.open("http://10.51.118.219:8091/MobileApplicationCertifier/"); */
		window.location.href = a
				+ '/digitalQAService/mobileCertification/mac.jsp';
	} else if (param == 'digitalPaymentTesting') {
		/* window.location.href=a+'/digitalQAService/digitalPaymentTesting/digitalPaymentTesting.jsp'; */
		window.location.href = a + '/common/WorkInProgress.jsp';
	} else if (param == 'internetOfThing') {
		window.location.href = a + '/console/runHome?toolName=CGAF_Perfecto';
	} else if (param == 'performanceTesting') {
		window.location.href = a + '/console/runHome?toolName=CGPF_Neoload';
		// window.location.href=a+'/common/WorkInProgress.jsp';
		/* window.location.href=a+'/digitalQAService/performanceTesting/performanceTesting.jsp'; */
	} else if (param == 'securityTesting') {
		window.location.href = a + '/common/WorkInProgress.jsp';
		// window.location.href=a+'/digitalQAService/securityTesting/securityTesting.jsp';
	} else if (param == 'bddAutomation') {
		window.location.href = a
				+ '/console/runHome?toolName=CGAF_Cucumber_Appium';
	} else if (param == 'automated_Accessibility') {
		window.location.href = a
		+ '/console/runHome?toolName=Automated_Accessibility';
} 
	
	else if (param == 'serviceAutomation') {
		window.location.href = a + '/common/WorkInProgress.jsp';
		/* window.location.href=a+'/continuousDelivery/serviceAutomation/serviceAutomation.jsp'; */
	} else if (param == 'crossBrowser') {

		/*window.location.href = a
				+ '/continuousDelivery/crossBrowserAutomation/optik.jsp';*/
		window.open("http://in-pnq-coe19:8081/OPTIK/landing");
	} else if (param == 'functionalAutomation') {
		/* window.location.href=a+'/continuousDelivery/functionalAutomation/functionalAutomation.jsp'; */
		window.location.href = a + '/console/runHome?toolName=CGAF_Usability';
	} else if (param == 'uiAutomation') {
		window.location.href = a
				+ '/console/runHome?toolName=CGAF_LayoutTesting';
		/* window.location.href=a+'/continuousDelivery/uiAutomation/uiAutomation.jsp'; */
	} else if (param == 'appiumGrid') {
		
		window.location.href = a
		+ '/console/runHome?toolName=Appium_Grid';
	} else if (param == 'IMTAFramework') {
		
		window.location.href = a
		+ '/console/runHome?toolName=IMTAFramework';
	}
	
	else if (param == 'dashboard') {
		window.location.href = a
				+ '/dashboardAndMonitoring/dashboard/dashboardForCommandCenter.jsp';
	} else if (param == 'predictiveAnalysis') {
		/* window.location.href=a+'/common/WorkInProgress.jsp'; */
		window.location.href = a
				+ '/dashboardAndMonitoring/predictiveAnalysis/smartQA.jsp';
		/* window.open("http://in-pnq-coe40:8080/SmartQA_DIG_A/index"); */
		/* window.location.href=a+'/common/WorkInProgress.jsp'; */
	} else if (param == 'EnvironmentSetUp') {
		window.location.href = a
				+ '/dashboardAndMonitoring/qualityGateConfiguration/configuration.jsp';
		// window.location.href=a+'/dashboardAndMonitoring/predictiveAnalysis/predictiveAnalysis.jsp';
	}
	else if (param == 'Projects') {
		window.location.href = a + '/adminProject';

	}
	

}

function getContextPathFromAccordion() {
	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 0));
}

function changeViewFromAccordion(param) {

	var a = getContextPath();
	if (param == 'mobile') {
		window.location.href = a + '/integratedQALabs/mobileLab/mobileLab.jsp';
	} else if (param == 'cloud') {

		window.location.href = a
				+ '/integratedQALabs/cloudTesting/cloud-testing.jsp';
	} else if (param == 'iot') {
		window.location.href = a + '/integratedQALabs/iot/iot.jsp';
	} else if (param == 'paymentDevice') {
		window.location.href = a
				+ '/integratedQALabs/paymentDevice/paymentDevice.jsp';
	} else if (param == 'userExperienceTesting') {

		window.location.href = a
				+ '/digitalQAService/userExperienceTesting/userExperienceTesting.jsp';
	} else if (param == 'sentimentAnalytics') {
		window.location.href = a
				+ '/digitalQAService/userExperienceTesting/sentiment/sentimentAnalysis.jsp';
	} else if (param == 'accessibilityTesting') {
		window.location.href = a
				+ '/digitalQAService/accessibilityTesting/accessibilityTesting.jsp';

	} else if (param == 'mobileAppsTesting') {
		window.location.href = a
				+ '/digitalQAService/mobileAppTesting/mobileAppTesting.jsp';

	} else if (param == 'crossBrowserTesting') {
		window.location.href = a
				+ '/digitalQAService/crossBrowserTesting/crossBrowserTesting.jsp';

	} else if (param == 'mobileCertificationTesting') {

		window.location.href = a
				+ '/digitalQAService/mobileCertification/mobileCertification.jsp';
	} else if (param == 'digitalPaymentTesting') {
		window.location.href = a
				+ '/digitalQAService/digitalPaymentTesting/digitalPaymentTesting.jsp';

	} else if (param == 'internetOfThing') {
		window.location.href = a
				+ '/digitalQAService/internetOfThing/internetOfThing.jsp';
	} else if (param == 'performanceTesting') {

		window.location.href = a
				+ '/digitalQAService/performanceTesting/performanceTesting.jsp';
	} else if (param == 'securityTesting') {

		window.location.href = a
				+ '/digitalQAService/securityTesting/securityTesting.jsp';
	} else if (param == 'contentManagementSystemTesting') {

		window.location.href = a
				+ '/digitalQAService/contentManagementSystemTesting/cmsTesting.jsp';
	} else if (param == 'businessProcessTesting') {

		window.location.href = a
				+ '/digitalQAService/businessProcessTesting/bptTesting.jsp';
	} else if (param == 'customerRelationshipManagementTesting') {

		window.location.href = a
				+ '/digitalQAService/customerRelationshipManagementTesting/crmTesting.jsp';
	} else if (param == 'mobileCertification') {

		window.location.href = a
				+ '/digitalQAService/mobileCertification/mobileCertification.jsp';
	} else if (param == 'bddAutomation') {
		window.location.href = a
				+ '/continuousDelivery/bddAutomation/bddAutomation.jsp';
	} else if (param == 'serviceAutomation') {

		window.location.href = a
				+ '/continuousDelivery/serviceAutomation/serviceAutomation.jsp';
	} else if (param == 'crossBrowser') {

		window.location.href = a
				+ '/continuousDelivery/crossBrowserAutomation/crossBrowserAutomation.jsp';

	} else if (param == 'functionalAutomation') {
		window.location.href = a
				+ '/continuousDelivery/functionalAutomation/functionalAutomation.jsp';

	} else if (param == 'uiAutomation') {

		window.location.href = a
				+ '/continuousDelivery/uiAutomation/uiAutomation.jsp';
	} else if (param == 'dashboard') {
		window.location.href = a
				+ '/dashboardAndMonitoring/dashboard/dashboard.jsp';
	} else if (param == 'predictiveAnalysis') {

		window.location.href = a
				+ '/dashboardAndMonitoring/predictiveAnalysis/predictiveAnalysis.jsp';

	} else if (param == 'environmentSetup') {
		// window.location.href=a+'/dashboardAndMonitoring/qualityGateConfiguration/configuration.jsp';

	}

}

function goToLandingPage() {

	var a = getContextPath();
	window.location.href = a + '/landing_new.jsp';
}

function viewInfo(param) {

	var a = getContextPath();
	if (param == 'CGAF_Cucumber_Appium')
		window.location.href = a
				+ '/continuousDelivery/bddAutomation/bddAutomation.jsp';
	else if (param == 'CGAF_Seetest')
		window.location.href = a
				+ '/continuousDelivery/functionalAutomation/functionalAutomation.jsp';
	else if (param == 'CGAF_Perfecto')
		window.location.href = a
				+ '/digitalQAService/internetOfThing/internetOfThing.jsp'
	else if (param == 'CGAF_LayoutTesting')
		window.location.href = a
				+ '/continuousDelivery/uiAutomation/uiAutomation.jsp'
	else if (param == 'CGPF_Neoload')
		window.location.href = a
				+ '/digitalQAService/performanceTesting/performanceTesting.jsp'
				
}

function changeAccordion(elementId, panelId) {
	// alert(elementId+" "+panelId);
	var ele = document.getElementById(elementId);

	ele.classList.add("accordionMenuBg");

	ele.children[0].classList.add("accordionMenuBg");
	// alert("gfdg "+ele.children[0]);

	var element = document.getElementById(panelId);
	if (element.classList.contains("collapse")) {
		element.classList.remove("collapse");
		element.classList.add("collapse in");
	}

}
