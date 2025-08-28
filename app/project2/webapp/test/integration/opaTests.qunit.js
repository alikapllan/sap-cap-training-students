sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'lms/project2/test/integration/FirstJourney',
		'lms/project2/test/integration/pages/GetStudentList',
		'lms/project2/test/integration/pages/GetStudentObjectPage',
		'lms/project2/test/integration/pages/GetEnrollmentObjectPage'
    ],
    function(JourneyRunner, opaJourney, GetStudentList, GetStudentObjectPage, GetEnrollmentObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('lms/project2') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheGetStudentList: GetStudentList,
					onTheGetStudentObjectPage: GetStudentObjectPage,
					onTheGetEnrollmentObjectPage: GetEnrollmentObjectPage
                }
            },
            opaJourney.run
        );
    }
);