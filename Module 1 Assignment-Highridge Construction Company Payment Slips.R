# Load necessary library
set.seed(123)  # This will generate the random results

# Step 1 & 2: Generate 400 workers
# n as name
# s as salary
# g as gender
genders <- c("Male", "Female")
workers <- data.frame(
  id = paste0("EMP", 1:400),
  n = paste0("Worker_", 1:400),
  s = sample(7000:33000, 400, replace = TRUE),
  g = sample(genders, 400, replace = TRUE)
)

# Step 3, 4, and 5: Generate payment slips
for (j in 1:nrow(workers)) {
  tryCatch({
    emp_id <- workers$id[j]
    name <- workers$n[j]
    sal <- workers$s[j]
    gen <- workers$g[j]
    level <- "Unspecified"
    
    if (sal > 10000 && sal < 20000) {
      level <- "A1"
    }
    if (sal > 7500 && sal < 30000 && gen == "Female") {
      level <- "A5-F"
    }
    
    # Print payment slip
    cat("Payment Slip -", emp_id, "\n")
    cat("Name        :", name, "\n")
    cat("Salary      : $", sal, "\n")
    cat("Gender      :", gen, "\n")
    cat("Employee Level:", level, "\n")
    cat(paste(rep("*-", 15), collapse = ""), "\n\n")
    
  }, error = function(e) {
    cat("Error processing worker", workers$id[i], ":", e$message, "\n")
  })
}
