


# setwd("/Users/brun/GitHubnceas/SNAPP/postdoc-training/04-Intro-R")

babynames_files <- list.files("data/namesbystate", pattern = "*.TXT", full.names = TRUE)

N = 52

df_famous <- data.frame("state" = rep("", N),
                        "gender" = rep("", N),
                        "year" = rep(NA, N),
                        "famous_name" = rep("", N),
                        "count" = rep(NA, N),
                        "unique_names" = rep(NA, N),
                        stringsAsFactors = FALSE
)


for (i in seq_along(babynames_files)){
  state_df <- read.csv(babynames_files[[i]], header = FALSE, stringsAsFactors = FALSE)
  colnames(state_df) <- c("state", "gender", "year", "firstname", "count")
  famous_count <- max(state_df$count)
  unique_names <- length(unique(state_df$firstname))
  famous_row <- state_df[state_df$count == famous_count,]
  # famous_row <- subset(state_df, state_df$firstname=="Thomas")
  famous_row$unique_names <- unique_names
  df_famous[i, ] <- famous_row
}
