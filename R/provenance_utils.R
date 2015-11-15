#' md5table
#' For use in data analysis provenance, generates a data frame with file names and md5 values for use in checking for changes to source data files.  Is not able to validate changes to source data files.
#' @param file_list single file or vector of file names used as input
#'
#' @return data_frame with file name and md5 value
#' @export
#'
#' @examples md5table(file_list)
md5table <- function(file_list){
    dat_info <- dplyr::data_frame()
    for(dat_file in file_list){
        if(!file.exists(dat_file)){
            warning(paste("no file named", dat_file, "found"))
        }
        md5val <- tools::md5sum(dat_file)
        dat_info <- dplyr::data_frame(file_name = dat_file, md5 = md5val) %>%
            dplyr::bind_rows(dat_info,.)
    }
    return(dat_info)
}
