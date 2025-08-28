sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'lms.project2',
            componentId: 'GetStudentList',
            contextPath: '/GetStudent'
        },
        CustomPageDefinitions
    );
});