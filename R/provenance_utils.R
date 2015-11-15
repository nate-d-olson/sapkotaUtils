md5table <- function(file_list){
    dat_info <- dplyr::data_frame()
    for(dat_file in source_dat_files){
        md5val <- tools::md5sum(dat_file)
        dat_info <- data_frame(file_name = dat_file, md5 = md5val) %>%
            bind_rows(dat_info,.)
    }
    return(dat_info)
}
