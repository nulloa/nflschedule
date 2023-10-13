# This script generates the 'nflschedule2023', 'nflschedule2023_transformed' and 'nflteams' datasets

nflschedule2023 <- get_schedule(year="2023", original=T)
save(nflschedule2023, file="data/nflschedule2023.RData")

nflschedule2023_transformed <- get_schedule(year="2023", original=F)
save(nflschedule2023_transformed, file="data/nflschedule2023_transformed.RData")

nflteams <- unique(nflschedule2023$Team)
save(nflteams, file="data/nflteams.RData")
