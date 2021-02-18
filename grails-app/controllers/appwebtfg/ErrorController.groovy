package appwebtfg

import grails.plugin.springsecurity.annotation.Secured

/**
 * Controller used to manage HTTP errors
 */
@Secured(["permitAll"])
class ErrorController {

    /**
     * Method call when a HTTP 404 error occurs
     * @return view "/notFound"
     */
    def notFound() {
        render(view: "notFound")
    }

    /**
     * Method call when a HTTP 500 error occurs
     * @return view "/error"
     */
    def internalError() {
        render(view: "error")
    }

    /**
     * Method call when a HTTP 403 error occurs
     * @return view "/notAllowed"
     */
    def notAllowed() {
        render(view: "notAllowed")
    }
}
