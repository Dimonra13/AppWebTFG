package appwebtfg

import grails.plugin.springsecurity.annotation.Secured

@Secured(["permitAll"])
class ErrorController {

    def notFound(){
        render(view: "notFound")
    }

    def internalError(){
        render(view: "error")
    }

    def notAllowed(){
        render(view: "notAllowed")
    }
}
