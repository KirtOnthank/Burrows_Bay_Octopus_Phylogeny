library("ridigbio")
library("rgbif")
idig_search_records(rq=list(genus="muusoctopus"))

idig_search_records(rq=list(scientificname="muusoctopus leioderma"),fields="all")
idig_search_records(rq=list(scientificname="benthoctopus leioderma"),fields="all")
idig_search_records(rq=list(scientificname="Octopus leioderma"),fields = "all")

leioderma=occ_search(scientificName = "Muusoctopus leioderma")

leioderma$data$taxonKey

occ_count(taxonKey = 2289412)

idig_search_records(rq=list(scientificname="Octopus rubescens"),fields="all")
rubescens=occ_search(scientificName = "Octopus rubescens",limit=1500)
occ_count(taxonKey = 2289636)
rubescens$data$year


muus=occ_search(taxonKey = 4621781,limit=2000)

min(muus$data$depth[muus$data$depth>0],na.rm = T)
sum(muus$data$depth==0,na.rm = T)

sort(muus$data$depth)

muus$data$acceptedScientificName[order(muus$data$depth)][1:10]

data.frame(muus$data[order(muus$data$depth),][1:10,])

table(muus$data$datasetName)

rm(muus)
rm(leioderma)
rm(rubescens)
