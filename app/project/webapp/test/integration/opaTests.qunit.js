sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'captrainingstudents/project/test/integration/FirstJourney',
		'captrainingstudents/project/test/integration/pages/StudentList',
		'captrainingstudents/project/test/integration/pages/StudentObjectPage'
    ],
    function(JourneyRunner, opaJourney, StudentList, StudentObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('captrainingstudents/project') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStudentList: StudentList,
					onTheStudentObjectPage: StudentObjectPage
                }
            },
            opaJourney.run
        );
    }
);