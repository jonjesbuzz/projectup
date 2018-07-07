public class CProject: Project {
    public override var structure: [FileElement] {
        return [
            File("Makefile", templateContent: makefile, context: ["projectName": self.projectName.lowercased()]),
            Directory("src", contents: [
                File("\(self.projectName.lowercased()).c", content: "#include <\(self.projectName.lowercased()).h>"),
                File("main.c", content: mainFile)
            ]),
            Directory("include", contents: [
                File("\(self.projectName.lowercased()).h"),
            ])
        ]
    }

    let mainFile = """
    #include <stdio.h>
    int main(void) {
        printf(\"%s\\n\", \"Hello world!\");
        return 0;
    }
    """

    let makefile = """
    CC = cc

    SRCDIR = src
    OBJDIR = obj
    LIBDIR = lib
    INCLUDEDIR = include

    CFLAGS += -I$(INCLUDEDIR) -std=c11 -O3 -Wall -Wextra
    LDFLAGS += -L$(LIBDIR) -l$(NAME)

    NAME = {{ projectName }}

    all: $(NAME) lib$(NAME).a

    $(NAME): $(SRCDIR)/main.c lib$(NAME).a
    \t$(CC) $(CFLAGS) $< $(LDFLAGS) -o $@

    $(OBJDIR)/$(NAME).o: $(SRCDIR)/$(NAME).c | $(OBJDIR)

    lib$(NAME).a: $(OBJDIR)/$(NAME).o | $(LIBDIR)

    %.a:
    \tar rcs $(LIBDIR)/$@ $?

    $(OBJDIR)/%.o: $(SRCDIR)/%.c
    \t$(CC) $(CFLAGS) $^ -c -o $@

    $(OBJDIR):
    \tmkdir -p $@

    $(LIBDIR):
    \tmkdir -p $@

    clean:
    \trm -rf $(NAME) $(LIBDIR) $(OBJDIR)

    """
}