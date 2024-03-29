from shutil import copyfile
from itertools import islice
import pdfkit
import os


def process(file_path, filename):
    copyfile(file_path, temp_file := "".join([filename, ".txt"]))

    with open(temp_file, "rb") as myfile:
        head = list(islice(myfile, 1000))

    with open(temp_file, mode="wb") as f2:
        for item in head:
            if item.strip() == "Content-Disposition: attachment;":
                break
            f2.write(item)

    pdfkit.from_file(
        temp_file,
        os.path.join(lambda_write_path, pdf_file_name),
    )


file_path = r"D:\tmp\case_number\exhibits\folder1\3\email_7.eml"
filename = "email_7"
lambda_write_path = r"\tmp"
pdf_file_name = "email_7_dv.pdf"
process(file_path, filename)
