extends Node

var cvLink: String = "https://docs.google.com/document/d/1A7ik9WB3DoZjt2GDuVLD4RuFI8bxbhrDT-x_bHZYB2o/edit?usp=sharing"

func OpenCVLink():
	OS.shell_open(cvLink)
	pass
