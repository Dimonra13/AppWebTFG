package appwebtfg

import grails.testing.mixin.integration.Integration
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.test.annotation.Rollback
import spock.lang.Unroll

@Integration
@Rollback
class CategoryControllerIntegrationSpec extends BaseControllerIntegrationSpec {

    @Autowired
    CategoryController categoryController

    String controllerName = "category"

    static Set<String> categories = ['Data-Science','Machine-Learning','Cloud-Computing','Engineering','Business-Finance',
                              'Security','Leadership','Entrepreneurship','Personal-Development','Human-Studies','Education','Arts',
                              'Maths','Health','Science','Marketing','Architecture','Software-Engineering','IT-Certification','Test-Prep',
                              'Graphic-Design','Gaming','Google','Apple','Oracle','Microsoft','SAP']

    @Unroll
    void "Validate the getCategory method"(String id) {

        when: 'The controller action is call'
        Course.withNewSession { it ->
            categoryController.getCategory(id)
        }

        then: 'validate that the method output is 200 when the category exists and 404 otherwise'
        categoryController.response.status == categories.contains(id) ? 200 : 404

        where:
        id << categories+[null,'','test','Test-Category','Should-Fail','Fake-Category']

    }
}
