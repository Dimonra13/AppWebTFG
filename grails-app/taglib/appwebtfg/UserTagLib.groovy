package appwebtfg

import grails.plugin.springsecurity.SpringSecurityService

class UserTagLib {

    SpringSecurityService springSecurityService

    static defaultEncodeAs = [taglib:'html']
    static returnObjectForTags = ['loggedUser', 'isLogged']

    def loggedUser = {
        return springSecurityService.getCurrentUser()
    }

    def isLogged = {
        return springSecurityService.isLoggedIn()
    }
}
