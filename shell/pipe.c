#include "pipe.h"
#include "memory.h"
#include "fs.h"
#include "file.h"
#include "ioqueue.h"
#include "thread.h"
/*  Pipe is just a combination of redirection that we defined for simplicity*/


/*  checking if locak_fd is pointing to a pipe*/
bool is_pipe(uint32_t local_fd){
    uint32_t global_fd = fd_local2global(local_fd);
    return file_table[global_fd].fd_flag == PIPE_FLAG;
}

/*  create pipe, return 0 if success, -1 if failed*/
int32_t sys_pipe(int32_t pipefd[2]){
    int32_t global_fd = get_free_slot_in_global();

    /*apply one page of memory*/
    file_table[global_fd].fd_inode = get_kernel_pages(1);

    /*init ioqueue*/
    ioqueue_init((struct ioqueue*)file_table[global_fd].fd_inode);
    if(file_table[global_fd].fd_inode == NULL){
        return -1;
    }
    
    /*set to pipe*/
    file_table[global_fd].fd_flag = PIPE_FLAG;

    /*fd_pos serve as open count*/
    file_table[global_fd].fd_pos = 2;
    pipefd[0] = pcb_fd_install(global_fd);
    pipefd[1] = pcb_fd_install(global_fd);
    return 0;
}

/*  redirect old_local_fd to new_local_fd*/
void sys_fd_redirect(uint32_t old_local_fd, uint32_t new_local_fd){
    struct task_struct* cur = running_thread();
    if(new_local_fd < 3){
        cur->fd_table[old_local_fd] = new_local_fd;
    }else{
        uint32_t new_global_fd = cur->fd_table[new_local_fd];
        cur->fd_table[old_local_fd] = new_global_fd;
    }
}
/*  read from pipe*/
uint32_t pipe_read(int32_t fd, void* buf, uint32_t count){
    char* buffer = buf;
    uint32_t bytes_read = 0;
    uint32_t global_fd = fd_local2global(fd);

    struct ioqueue* ioq = (struct ioqueue*)file_table[global_fd].fd_inode;

    uint32_t ioq_len = ioq_length(ioq);
    uint32_t size = ioq_len > count ? count : ioq_len;
    while(bytes_read < size){
        *buffer = ioq_getchar(ioq);
        bytes_read++;
        buffer++;
    }
    return bytes_read;
}

/*  write to pipe*/
uint32_t pipe_write(int32_t fd, const void* buf, uint32_t count){
    uint32_t bytes_write = 0;
    uint32_t global_fd = fd_local2global(fd);
    struct ioqueue* ioq = (struct ioqueue*)file_table[global_fd].fd_inode;

    uint32_t ioq_left = bufsize - ioq_length(ioq);
    uint32_t size = ioq_left > count ? count : ioq_left;

    const char* buffer = buf;
    while(bytes_write < size){
        ioq_putchar(ioq, *buffer);
        bytes_write++;
        buffer++;
    }
    return bytes_write;
}