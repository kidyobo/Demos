#ifndef MOF_REQ_GET_PETCAMP_DATA_H
#define MOF_REQ_GET_PETCAMP_DATA_H

class req_get_petcamp_data{
public:
	void req_get_petcamp_data(void);
	void decode(ByteArray &);
	void PacketName(void);
	void ~req_get_petcamp_data();
	void build(ByteArray	&);
	void encode(ByteArray &);
}
#endif