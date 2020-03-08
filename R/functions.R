load("data/office.rda")
load("data/top_speakers.rda")
load("data/unique_episodes.rda")


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


what_episode <- function() {

    index <- sample(1:nrow(unique_episodes), 1)
    episode <- unique_episodes[index, ]
    return(paste0("You should watch episode ", episode$episode, " from season ", episode$season, " next!"))

}

quote_about <- function(word = "nuts") {

    indices <- grepl(word, office$line_text)
    subset <- office[indices, ]
    index <- sample(1:nrow(subset), 1)
    line <- subset[index,]
    return(paste0("In season ", line$season, ", episode ", line$episode, ", scene ", line$scene, " , ", line$speaker, " said '",
        line$line_text, "'"))

}
