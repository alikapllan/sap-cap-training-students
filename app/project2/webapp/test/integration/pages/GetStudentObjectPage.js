sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'lms.project2',
            componentId: 'GetStudentObjectPage',
            contextPath: '/GetStudent'
        },
        CustomPageDefinitions
    );
});