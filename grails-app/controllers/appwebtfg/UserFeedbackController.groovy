package appwebtfg

import grails.plugin.springsecurity.annotation.Secured

@Secured(["permitAll"])
class UserFeedbackController {

    def statistics() {
        List<UserFeedback> feedbackList = UserFeedback.list(offset:0,max:100)
        render(view: "statistics",model: [feedbackList: feedbackList])
    }
}
