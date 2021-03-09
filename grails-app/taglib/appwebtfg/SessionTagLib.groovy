package appwebtfg

import grails.plugin.springsecurity.SpringSecurityService

class SessionTagLib {

    SpringSecurityService springSecurityService

    static namespace = "s"
    static returnObjectForTags = ['loggedUser']

    def loggedUser = {
        return springSecurityService.getCurrentUser()
    }

}
