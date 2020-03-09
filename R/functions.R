load("data/office.rda")
load("data/top_speakers.rda")
load("data/unique_episodes.rda")
load("data/lines_with_speakers.rda")

# Function returns a random line from the character parameter in a show

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


# Function return a randomly generated episode

what_episode <- function() {

    index <- sample(1:nrow(unique_episodes), 1)
    episode <- unique_episodes[index, ]
    return(paste0("You should watch episode ", episode$episode, " from season ", episode$season, " next!"))

}


# Function returns a random line that includes the string parameter

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

# Function creates and opens an html that has the entire script for that episode

print_episode <- function(season = 1, episode = 1){

    lines <- lines_with_speakers[which(office$season == season & office$episode == season)]
    cat(lines, sep="  \n", file = "episode.Rmd")
    rmarkdown::render("episode.Rmd")
    system2("open","episode.html")
    file.remove("episode.Rmd")

}



