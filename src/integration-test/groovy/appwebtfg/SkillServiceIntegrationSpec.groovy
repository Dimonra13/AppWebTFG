package appwebtfg

import grails.gorm.transactions.Rollback
import grails.testing.mixin.integration.Integration
import spock.lang.Specification

@Rollback
@Integration
class SkillServiceIntegrationSpec extends Specification{

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            false == false
    }
}
