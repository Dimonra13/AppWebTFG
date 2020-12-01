package appwebtfg

import grails.plugin.springsecurity.annotation.Secured

class TestController {

    @Secured('ROLE_ADMIN')
    def index() {
        render(view:'/index')
    }
}
