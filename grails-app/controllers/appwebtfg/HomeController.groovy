package appwebtfg

import grails.plugin.springsecurity.annotation.Secured

@Secured(["permitAll"])
class HomeController {

    /**
     * Method that returns the home page
     * @return view "/index"
     */
    def index() {
        render(view:"/index")
    }
}
