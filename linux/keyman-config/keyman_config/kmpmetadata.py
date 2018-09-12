#!/usr/bin/python3

import json
import configparser
import sys
import os.path
import magic

def print_info(info):
	try:
		print("---- Info ----")
		print("Name: ", info['name']['description'])
		print("Copyright: ", info['copyright']['description'])
		print("Version: ", info['version']['description'])
		print("Author: ", info['author']['description'])
		print("Author URL: ", info['author']['url'])
		print("Website: ", info['website']['description'])
	except Exception:
		pass

def print_system(system):
	try:
		print("---- System ----")
		print("File Version: ", system['fileVersion'])
		print("Keyman Developer Version: ", system['keymanDeveloperVersion'])
	except Exception:
		pass

def print_options(options):
	try:
		print("---- Options ----")
		print("Readme File: ", options['readmeFile'])
		print("Graphic File: ", options['graphicFile'])
	except Exception:
		pass

def print_keyboards(keyboards):
	try:
		print("---- Keyboards ----")
		for kb in keyboards:
			print("Keyboard Name: ", kb['name'])
			print("Keyboard Id: ", kb['id'])
			print("Keyboard Version: ", kb['version'])
			if 'oskFont' in kb:
				print("Keyboard On screen keyboard Font: ", kb['oskFont'])
			if 'oskFont' in kb:
				print("Keyboard Display Font: ", kb['displayFont'])
			print("Languages")
			for lang in kb['languages']:
				print("  Name: ", lang['name'], "Id: ", lang['id'])
	except Exception:
		pass

def determine_filetype(filename):
	"""
	Determine file type of a filename in a kmp from the extension

	Args:
		filename (str): File name

	Returns:
		str: Description of file type
			Keyboard icon
			Keyboard source
			Compiled keyboard
			Compiled on screen keyboard
			Font
			Documentation
			Metadata
			Image
	"""
	name, ext = os.path.splitext(filename)
	if ext.lower() == ".ico":
		return "Keyboard icon"
	elif ext.lower() == ".kmn":
		return "Keyboard source"
	elif ext.lower() == ".kmx":
		return "Compiled keyboard"
	elif ext.lower() == ".kvk":
		return "Compiled on screen keyboard"
	elif ext.lower() == ".ttf" or ext.lower() == ".otf":
		return "Font"
	elif ext.lower() == ".txt" or ext.lower() == ".pdf" or ext.lower() == ".htm" or ext.lower() == ".html":
		return "Documentation"
	elif ext.lower() == ".inf" or ext.lower() == ".json":
		return "Metadata"
	elif ext.lower() == ".png" or ext.lower() == ".jpeg" or ext.lower() == ".jpg" or ext.lower() == ".gif":
		return "Image"
	else:
		return "Unknown type"

def print_files(files, extracted_dir):
	try:
		print("---- Files ----")
		for kbfile in files:
			print("* File name: ", kbfile['name'])
			print("    Description: ", kbfile['description'])
			print("    Type: ", determine_filetype(kbfile['name']))
			file = os.path.join(extracted_dir, kbfile['name'])
			if os.path.isfile(file):
				print("    File", file, "exists")
				ms = magic.open(magic.MAGIC_NONE)
				ms.load()
				ftype =  ms.file(file)
				print ("        Type: ", ftype)
				ms.close()
			else:
				print("    File", file, "does not exist")

	except Exception:
		pass

def get_fonts(files):
	fonts = []
	for kbfile in files:
		if determine_filetype(kbfile['name']) == "Font":
			fonts.append(kbfile)
	return fonts

def parseinfdata(inffile, verbose=False):
	"""
	Parse the metadata in a kmp.inf file.

	Args:
		jsonfile (str): Path to kmp.inf
		verbose (bool, default False): verbose output

	Returns:
		list[5]: info, system, options, keyboards, files
			info (dict):
				name (dict):
					description (str): KMP name
				copyright (dict):
					description (str): KMP copyright
				version (dict):
					description (str): KMP version
				author (dict):
					description (str): KMP author
					url (str): contact url for the author
			system (dict): System info
				fileVersion (str): Keyman file format version
				keymanDeveloperVersion (str): Keyman Developer version that compiled keyboard
			options (dict): Keyboard options
				readmeFile (str) : README for the keyboard
			keyboards (list): Keyboards in the kmp
				name (str): Keyboard name
				id (str): Keyboard ID
				version (str): Keyboard version
				oskFont (str, optional): Recommended on screen keyboard font
				displayFont (str, optional): Recommended display font
				languages (list): Languages the keyboard is used for
					name (str): Language name
					id (str): Language ID
			files (list): Files in the kmp
				name (str): File name
				description (str): File description
	"""
	info = system = keyboards = files = options = nonexistent = None
	extracted_dir = os.path.dirname(inffile)

	if os.path.isfile(inffile):
		config = configparser.ConfigParser()
		config.optionxform = str
		if verbose:
			print("reading file", inffile, "dir:", extracted_dir)

		with open(inffile, 'r', encoding='latin_1') as f:
			config.read_file(f)

		info = None
		for section in config.sections():
			if section == 'Info':
				if not info:
					info = {}
				for item in config.items('Info'):
					if item[0] == 'Name' or item[0] == 'name':
						info['name'] = { 'description' : item[1].split("\"")[1] }
					elif item[0] == 'Copyright' or item[0] == 'copyright':
						info['copyright'] = { 'description' : item[1].split("\"")[1] }
					elif item[0] == 'Version':
						info['version'] = { 'description' : item[1].split("\"")[1] }
					elif item[0] == 'Author':
						info['author'] = { 'description' : item[1].split("\"")[1], 'url' : item[1].split("\"")[3] }
					elif item[0] == "WebSite":
						info['website'] = { 'description' : item[1].split("\"")[1] }
					else:
						print("Unknown item in Info:", item[0])
			if section == 'PackageInfo':
				if not info:
					info = {}
				info['version'] = { 'description' : "1.0" }
				for item in config.items('PackageInfo'):
					if item[0] == 'Name' or item[0] == 'name':
						if item[1].split("\"")[1]:
							info['name'] = { 'description' : item[1].split("\"")[1] }
						else:
							info['name'] = { 'description' : item[1].split("\"")[2] }
					elif item[0] == 'Copyright' or item[0] == 'copyright':
						if item[1].split("\"")[1]:
							info['copyright'] = { 'description' : item[1].split("\"")[1] }
						else:
							info['copyright'] = { 'description' : item[1].split("\"")[2] }
					elif item[0] == 'Version':
						info['version'] = { 'description' : item[1].split("\"")[1] }
					elif item[0] == 'Author':
						info['author'] = { 'description' : item[1].split("\"")[1], 'url' : item[1].split("\"")[3] }
					elif item[0] == "WebSite":
						if item[1].split("\"")[1]:
							info['website'] = { 'description' : item[1].split("\"")[1] }
						else:
							info['website'] = { 'description' : item[1].split("\"")[2] }
					else:
						print("Unknown item in Info:", item[0])
			elif section == 'Package':
				system = {}
				if not options:
					options = {}
				for item in config.items('Package'):
					if item[0] == 'Version':
						system['fileVersion'] = item[1]
					elif item[0] == 'ReadMeFile':
						options['readmeFile'] = item[1]
					elif item[0] == 'GraphicFile':
						options['graphicFile'] = item[1]
					elif item[0] == 'ExecuteProgram':
						pass
					else:
						print("Unknown item in Package:", item[0])
				system['keymanDeveloperVersion'] = ""
			elif "Keyboard" in section:
				keyboards = []
				keyboard = {}
				languages = []
				for item in config.items(section):
					if item[0] == 'Name':
						keyboard['name'] = item[1]
					elif item[0] == 'ID':
						keyboard['id'] = item[1]
					elif item[0] == 'Version':
						keyboard['version'] = item[1]
					elif item[0] == 'OSKFont':
						keyboard['oskFont'] = item[1]
					elif item[0] == 'DisplayFont':
						keyboard['displayFont'] = item[1]
					elif "Language" in item[0]:
						langname, langid = item[1].split(",")
						languages.append({ 'name' : langname, 'id' : langid })
					else:
						print("Unknown item in keyboard:", item[0])
				keyboard['languages'] = languages
				keyboards.append(keyboard)
			elif section == "Files":
				files = []
				for item in config.items(section):
					splititem = item[1].split("\"")
					kbfile = { 'name' : splititem[3], 'description' : splititem[1] }
					files.append(kbfile)
			elif section == "InstallFiles":
				files = []
				for item in config.items(section):
					kbfile = { 'name' : item[0], 'description' : item[1] }
					files.append(kbfile)
			elif section == 'Install':
				if not options:
					options = {}
				for item in config.items('Install'):
					if item[0] == 'ReadmeFile':
						options['readmeFile'] = item[1]

		if verbose:
			print_info(info)
			print_system(system)
			print_options(options)
			print_keyboards(keyboards)
			print_files(files, extracted_dir)

	return info, system, options, keyboards, files

def parsemetadata(jsonfile, verbose=False):
	"""
	Parse the metadata in a kmp.json file.

	Args:
		jsonfile (str): Path to kmp.json
		verbose (bool, default False): verbose output

	Returns:
		list[5]: info, system, options, keyboards, files
			info (dict):
				name (dict):
					description (str): KMP name
				copyright (dict):
					description (str): KMP copyright
				version (dict):
					description (str): KMP version
				author (dict):
					description (str): KMP author
					url (str): contact url for the author
			system (dict): System info
				fileVersion (str): Keyman file format version
				keymanDeveloperVersion (str): Keyman Developer version that compiled keyboard
			options (dict): Keyboard options
				readmeFile (str) : README for the keyboard
			keyboards (list): Keyboards in the kmp
				name (str): Keyboard name
				id (str): Keyboard ID
				version (str): Keyboard version
				oskFont (str, optional): Recommended on screen keyboard font
				displayFont (str, optional): Recommended display font
				languages (list): Languages the keyboard is used for
					name (str): Language name
					id (str): Language ID
			files (list): Files in the kmp
				name (str): File name
				description (str): File description
	"""
	info = system = keyboards = files = options = nonexistent = None
	extracted_dir = os.path.dirname(jsonfile)

	if os.path.isfile(jsonfile):
		with open(jsonfile, "r") as read_file:
			data = json.load(read_file)
			for x in data:
				if x == 'info':
					info = data[x]
				elif x == 'system':
					system = data[x]
				elif x == 'keyboards':
					keyboards = data[x]
				elif x == 'files':
					files = data[x]
				elif x == 'options':
					options = data[x]
				elif x == 'nonexistent':
					nonexistent = data[x]
			if nonexistent != None:
				print("This should not happen")
			if verbose:
				print_info(info)
				print_system(system)
				if options:
					print_options(options)
				print_keyboards(keyboards)
				print_files(files, extracted_dir)
	return info, system, options, keyboards, files

def main(argv):
	if len(sys.argv) != 2:
		print("kmpmetadata.py <kmp.json> or <kmp.inf>")
		sys.exit(2)
	inputfile = sys.argv[1]
	
	if not os.path.isfile(inputfile):
		print("kmpmetadata.py Input file ", inputfile, " not found.")
		print("kmpmetadata.py <kmp.json> or <kmp.inf>")
		sys.exit(2)
	
	name, ext = os.path.splitext(inputfile)
	if ext == ".json":
		parsemetadata(inputfile, True)
	elif ext == ".inf":
		parseinfdata(inputfile, True)
	else:
		print("kmpmetadata.py Input file must be json or inf.")
		print("kmpmetadata.py <kmp.json> or <kmp.inf>")
		sys.exit(2)

if __name__ == "__main__":
        main(sys.argv[1:])
