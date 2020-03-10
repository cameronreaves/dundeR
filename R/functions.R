
#' Returns a random quote / line from a character in the show
#'
#' @param speaker A chr
#' @return If input is a character from the office, then the output is a chr vector
#' if input not found returns a printed mesage
#' @examples
#' preson_said(Pam)
#' @export

person_said <- function(speaker = "Jim") {

    if (speaker %in% top_speakers) {
        subset <- office[office$speaker == speaker, ]
        index <- sample(1:nrow(subset), 1)
        line <- subset[index, ]
        return(paste0("In season ", line$season, ", episode ", line$episode, ", scene ", line$scene, " , ", line$speaker, " said '",
            line$line_text, "'"))
    } else {
        print("Not popular character or wrong character name")
    }

}


#' Returns a random season and episode
#'
#' @param null
#' @return the output is a chr vector
#' @examples
#' what_episode()
#' @export

what_episode <- function() {

    index <- sample(1:nrow(unique_episodes), 1)
    episode <- unique_episodes[index, ]
    return(paste0("You should watch episode ", episode$episode, " from season ", episode$season, " next!"))

}



#' Returns a random quote / line that that has the word parameter in it
#'
#' @param word A chr
#' @return If input is a word found in at least one quote / line from the office, then the output is a chr vector
#' if input not found returns a printed message
#' @examples
#' quote_about(That's what she said)
#' @export

quote_about <- function(word = "nuts") {

    indices <- grepl(word, office$line_text)
    if(sum(indices) > 0) {
    subset <- office[indices, ]
    index <- sample(1:nrow(subset), 1)
    line <- subset[index,]
    return(paste0("In season ", line$season, ", episode ", line$episode, ", scene ", line$scene, " , ", line$speaker, " said '",
        line$line_text, "'"))
    }
    else{
        print("word not found")
    }

}

#' Returns an html page (Rmarkdown) saved to the user's working directory
#' @param season An int
#' @param episode An int
#' @return If input is valid episode from the show, then the output html
#' if input not returns null, markdown fails
#' @examples
#' print_episode(4, 2)
#' @export

print_episode <- function(season = 1, episode = 1) {

    lines <- lines_with_speakers[which(office$season == season & office$episode == episode)]
    cat(lines, sep="  \n", file = "episode.Rmd")
    rmarkdown::render("episode.Rmd")
    system2("open","episode.html")
    file.remove("episode.Rmd")

}
