context("provenance")

md5test_files <- c("md5_check_file1.txt","md5_check_file2.txt")
md5test_table <- md5table(md5test_files)
md5test_table1 <- md5table(md5test_files[1])
test_that("md5table function tests", {
          # function return class
          expect_is(md5table(md5test_files), "tbl_df")
          # multiple input files
          expect_equal(md5test_table$md5[1], "e090a8735baa2be9607015d2e4095997")
          expect_equal(md5test_table$md5[2], "d77a8bfdbdeff27ddc4d10d2d741ece1")
          # single input files
          expect_equal(md5test_table1$md5, "e090a8735baa2be9607015d2e4095997")
          # no wrong file name
          expect_warning(md5table("not_a_file.txt"),
                         paste("no file named not_a_file.txt found"))
})

