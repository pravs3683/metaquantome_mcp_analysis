library(dplyr)

flash <- read.delim('estimated_amounts/upstream_tool_outputs/FlashLFQ_QuantifiedBaseSequences.tsv',
                    stringsAsFactors = FALSE,
                    na.strings = c('0', '0.0', 'NA', "NaN")) %>%
    select(peptide = Sequence, starts_with("Int"))

library(stringr)

int_names <- names(flash)[2:9]
new_names_flash <- c('peptide', str_match(int_names, 'UPS.*$')[, 1])
names(flash) <- new_names_flash

write.table(flash, file='estimated_amounts/mqome_inputs/flash.tab',
            sep='\t', quote=F, row.names=F)
