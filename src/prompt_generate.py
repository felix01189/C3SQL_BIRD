import json
import argparse

def parse_option():
    parser = argparse.ArgumentParser("command line arguments for generate prompt")
    parser.add_argument("--input_dataset_path", type=str)
    parser.add_argument("--output_dataset_path", type=str)
    parser.add_argument("--evidence_option", type=str, default="option1")

    opt = parser.parse_args()

    return opt


if __name__ == "__main__":
    opt = parse_option()
    print(opt)
    with open(opt.input_dataset_path) as f:
        data_all = json.load(f)
    temp = []
    for id, data in enumerate(data_all):
        data['input_sequence'] = "### Complete sqlite SQL query only and with no explanation, and do not select extra columns that are not explicitly requested in the query. " \
                        "\n ### Sqlite SQL tables, with their properties: \n#\n"
        schema = ""
        for tab, cols in data['schema'].items():
            schema += '# ' + tab + ' ( '
            for i, col in enumerate(cols):
                schema += col
                if data['db_contents'][tab][i]:
                    schema += '("'
                    for value in data['db_contents'][tab][i]:
                        schema += value + '", "'
                    schema = schema[:-4] + '")'
                schema += ', '
            schema = schema[:-2] + ' )\n'
        data['input_sequence'] += schema[:-1]
        for fk in data['fk']:
            data['input_sequence'] += '\n# ' + fk
        
        if opt.evidence_option == 'option1':
            data['input_sequence'] += '\n#\n### ' + data['question'] + '\nSELECT'
        
        elif opt.evidence_option == 'option2':
            data['input_sequence'] += '\n#\n### ' + data['question'] + '\n#\n### ' + data['evidence'] + '\nSELECT'
        
        elif opt.evidence_option == 'option3':
            data['input_sequence'] += '\n#\n### question : ' + data['question'] + '\n#\n### evidence : ' + data['evidence'] + '\nSELECT'
        
        elif opt.evidence_option == 'option4':
            data['input_sequence'] += '\n#\n### question : ' + data['question'] + "\n#\n### The external knowledge necessary for sql generation is given as evidence with a request. " \ 
                "\n### Evidence is classified into four types: domain knowledge, numerical computation, synonym, and value Illustration. " \ 
                "\n### Examples of questions and evidence for four categories are as follows. " \ 
                "\n#\n### evidence : " + data['evidence'] + '\nSELECT'

    with open(opt.output_dataset_path, 'w') as f:
        json.dump(data_all, f, indent=2)

