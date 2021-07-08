package appwebtfg

import grails.plugin.springsecurity.annotation.Secured

@Secured(["permitAll"])
class UserFeedbackController {

    /**
     * Method that returns the page used to see the user feedback about the recommender API
     * @return view "statistics"
     */
    def statistics() {
        List<UserFeedback> feedbackList = UserFeedback.list(offset:0,max:100)
        render(view: "statistics",model: [feedbackList: feedbackList])
    }
}
