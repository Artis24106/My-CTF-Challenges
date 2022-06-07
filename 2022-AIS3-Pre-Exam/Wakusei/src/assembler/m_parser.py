from re import findall, match

r_label = r'\s*(.+):'
r_inst = r'\s*(\w+)\s*(\w*)'


def is_label(inst):
    return match(r_label, inst)


def get_label(inst):
    return findall(r_label, inst)[0]


def is_inst(inst):
    return match(r_inst, inst)


def get_inst(inst):
    return findall(r_inst, inst)[0]
